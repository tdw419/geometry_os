; drawing loop program
; initialization
  LDI r10, 0x8E12DE
  LDI r8, 8
main_0:
  CMPI r3, 0x40E907
  ADDI r8, r7, 1
  MUL r13, r12, r9
  LDI r4, 255
  LDI r6, 613
  LDI r0, 675
  DRAWTEXT r4, r6, r0, "WORLD"
  CMP r6, r1
  FRAME
  JMP main_0
