; drawing loop program
; initialization
  LDI r6, 8
  LDI r4, 2262
  LDI r15, 0x0E1BF3
  LDI r13, 250
  LDI r12, 3990
main_0:
  IKEY r5
  CMPI r5, 256
  JNZ r5, key_1
  LDI r10, 2417
  LDI r3, 0x5587E7
  LDI r7, 0x8D6A92
  LDI r7, 0
  LDI r5, 128
  RECTF r10, r3, r7, r7, r5
  AND r14, r5, r9
  XOR r12, r0, r6
  AND r7, r8, r5
  OR r11, r7, r1
  SUB r12, r4, r10
  FRAME
  JMP main_0
