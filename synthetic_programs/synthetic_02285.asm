; input driven program
; initialization
  LDI r11, 8
  LDI r3, 0x9F72E9
  LDI r7, 0x3CD782
  LDI r9, 64
  LDI r12, 737
  LDI r8, 128
main_0:
  ADDI r11, r13, 0x8570EE
  LDI r10, 0x04290A
  LDI r1, 3118
  LDI r8, 3750
  DRAWTEXT r10, r1, r8, "WORLD"
  IKEY r5
  CMPI r5, 222
  JNZ r5, key_1
  IKEY r0
  CMPI r0, 4
  JNZ r0, key_2
  FRAME
  JMP main_0
