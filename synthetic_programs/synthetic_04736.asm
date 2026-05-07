; mixed program
; initialization
  LDI r5, 10
  LDI r8, 0x48FBEC
  LDI r9, 4033
  LDI r0, 0x39FA2C
  LDI r7, 618
  LDI r3, 3843
  LDI r10, 0xF910F0
; palette
  LDI r14, 0x20C7
  LDI r5, 1
  LDI r11, 0xFFAA00
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xFF0000
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xAAAAAA
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x8800FF
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x550077
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xAA00AA
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xFFFFFF
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xAAAAAA
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xFFAA00
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0xFFEE00
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x000066
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x00FFAA
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x00AAFF
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x0044FF
  STORE r14, r11
  ADD r14, r14, r5
  LDI r11, 0x444444
  STORE r14, r11
  ADD r14, r14, r5
  LDI r13, 255
  LDI r15, 2764
  LDI r9, 1
  LDI r1, 3428
  LDI r0, 0
  RECTF r13, r15, r9, r1, r0
  AND r1, r9, r8
  XOR r8, r9, r15
  XOR r13, r9, r1
  OR r2, r3, r9
  LDI r5, 6
loop_0:
  LDI r3, 255
  LDI r5, 4
  LDI r14, 128
  LDI r2, 1
  LDI r13, 128
  RECTF r3, r5, r14, r2, r13
  SUBI r8, r13, 2
  LDI r9, 0x574D38
  LDI r14, 8
  LDI r7, 16
  LDI r4, 209
  CIRCLE r9, r14, r7, r4
  LDI r0, 1
  SUB r5, r5, r0
  JNZ r5, loop_0
  SHL r8, r9, r1
  SHL r6, r13, r9
  SHLI r7, r15, 0x9BC37B
  LDI r0, 1098
  LDI r26, 8
  LDI r1, 456
  LDI r1, 1468
  LDI r30, 0x2BC5D9
  RECTF r0, r26, r1, r1, r30
  SHLI r6, r0, 1
  SHR r10, r2, r1
  SHL r0, r1, r8
  SHLI r11, r8, 10
  LDI r8, 8
  LDI r3, 8
  LDI r21, 10
  DRAWTEXT r8, r3, r21, "WORLD"
  XOR r4, r11, r12
  XOR r29, r7, r3
  OR r0, r6, r7
  OR r11, r9, r12
  HALT
