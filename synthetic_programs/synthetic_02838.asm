; input driven program
; initialization
  LDI r15, 2
  LDI r7, 0x26FCDA
  LDI r0, 255
main_0:
  LDI r6, 0xE1DA89
  LDI r16, 10
  LDI r12, 0x1B6CE9
  DRAWTEXT r6, r16, r12, "WORLD"
  IKEY r24
  CMPI r24, 1
  JNZ r24, key_1
  SUB r5, r9, r10
  LDI r15, 4031
  LDI r13, 64
  LDI r8, 3879
  PSET r15, r13, r8
  IKEY r10
  CMPI r10, 135
  JNZ r10, key_2
  FRAME
  JMP main_0
