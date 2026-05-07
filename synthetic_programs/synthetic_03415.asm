; input driven program
; initialization
  LDI r14, 128
  LDI r28, 32
  LDI r6, 0x5E8013
  LDI r8, 0xB7A4AA
main_0:
  IKEY r12
  CMPI r12, 64
  JNZ r12, key_1
  ANDI r15, r0, 0xBD0519
  OR r10, r2, r15
  AND r4, r1, r11
  OR r7, r5, r4
  FRAME
  JMP main_0
