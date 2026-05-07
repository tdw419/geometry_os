; mixed program
; initialization
  LDI r9, 256
  LDI r6, 0x9BFBF2
  LDI r10, 0x1E802B
  LDI r11, 0x19CE4A
  LDI r3, 64
  LDI r0, 2276
  LDI r24, 0x1935B5
; palette
  LDI r6, 0x21B4
  LDI r11, 1
  LDI r9, 0x444444
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0xFFAA00
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0x000000
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0xAAAAAA
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0xDD0044
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0xFF0000
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0x000066
  STORE r6, r9
  ADD r6, r6, r11
  LDI r9, 0x0044FF
  STORE r6, r9
  ADD r6, r6, r11
  SAR r0, r4, r8
  SHR r4, r6, r9
  SAR r6, r9, r31
  LDI r23, 4
  LDI r4, 32
  LDI r3, 64
  LDI r13, 1185
  LDI r10, 128
  RECTF r23, r4, r3, r13, r10
  SAR r12, r5, r9
  SHL r4, r26, r1
  SHLI r14, r3, 10
main_0:
  SHLI r7, r3, 0xD8837F
  SHL r5, r13, r4
  SHLI r11, r10, 255
  CMP r2, r27
  AND r7, r10, r0
  AND r10, r6, r2
  IKEY r6
  CMPI r6, 16
  JNZ r6, key_1
  OR r10, r6, r1
  XOR r11, r2, r0
  OR r12, r5, r2
  XOR r10, r3, r14
  FRAME
  JMP main_0
