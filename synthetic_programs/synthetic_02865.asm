; input driven program
; initialization
  LDI r11, 32
  LDI r6, 0x23F468
  LDI r7, 32
  LDI r9, 0xD1628D
  LDI r1, 553
  LDI r14, 3697
main_0:
  OR r0, r7, r3
  XOR r15, r7, r14
  XOR r8, r15, r10
  AND r8, r14, r12
  ANDI r1, r7, 166
  XOR r13, r3, r16
  XOR r8, r10, r4
  OR r2, r0, r14
  CMP r2, r12
  IKEY r14
  CMPI r14, 153
  JNZ r14, key_1
  SHL r22, r4, r13
  FRAME
  JMP main_0
