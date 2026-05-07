; input driven program
; initialization
  LDI r9, 3619
  LDI r5, 182
  LDI r13, 1780
  LDI r8, 0x9C12B6
  LDI r12, 1245
  LDI r6, 64
  LDI r1, 0
  LDI r24, 1253
main_0:
  LDI r0, 256
  LDI r0, 0xA3C2C9
  LDI r6, 2685
  TEXT r0, r0, r6, "HELLO"
  ADDI r19, r0, 8
  CMPI r11, r0, 57
  SHL r19, r4, r11
  SHL r9, r2, r12
  LDI r15, 1868
  LDI r2, 0x3D91BC
  LDI r4, 1693
  DRAWTEXT r15, r2, r4, "WORLD"
  OR r7, r1, r10
  XOR r23, r3, r8
  OR r8, r0, r4
  OR r4, r15, r2
  FRAME
  JMP main_0
