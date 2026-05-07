; input driven program
; initialization
  LDI r7, 0xB5AAA4
  LDI r12, 0x6F8BE8
  LDI r8, 2
  LDI r30, 0x19EAF4
  LDI r6, 0x4C4752
main_0:
  IKEY r3
  CMPI r3, 216
  JNZ r3, key_1
  SHR r5, r7, r11
  AND r0, r8, r7
  OR r1, r9, r4
  AND r14, r2, r1
  OR r6, r4, r14
  FRAME
  JMP main_0
