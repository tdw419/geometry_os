; drawing loop program
; initialization
  LDI r9, 64
  LDI r5, 359
  LDI r7, 0x08CCB2
  LDI r3, 3447
  LDI r10, 0
  LDI r0, 0x450974
  LDI r4, 0x77F6A4
  LDI r13, 0xC37E82
main_0:
  LDI r8, 64
  LDI r0, 0xE54887
  LDI r15, 128
  LDI r5, 3516
  LDI r15, 0x7A0BB1
  LINE r8, r0, r15, r5, r15
  IKEY r11
  CMPI r11, 227
  JNZ r11, key_1
  SHL r14, r15, r9
  SHLI r9, r14, 0xCA6D85
  SHLI r2, r28, 0xC3C216
  MOD r9, r7, r10
  AND r2, r15, r1
  AND r1, r3, r2
  AND r6, r1, r3
  OR r12, r5, r15
  SHR r8, r11, r10
  SHLI r15, r6, 10
  SAR r12, r11, r0
  SAR r5, r7, r15
  FRAME
  JMP main_0
