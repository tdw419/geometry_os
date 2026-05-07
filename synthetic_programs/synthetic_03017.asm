; mixed program
; initialization
  LDI r2, 0x64757C
  LDI r4, 10
  LDI r7, 2979
  LDI r11, 0x75BAD6
  LDI r8, 1
  LDI r6, 0xC0A884
; palette
  LDI r5, 0x22C1
  LDI r1, 1
  LDI r6, 0xFFFF00
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xFF00FF
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x888800
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x00AAFF
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xFF8800
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x550077
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x00FF00
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xAAAAAA
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xFFAA00
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x00FFFF
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x888800
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xFFFFFF
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x44FF00
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xAA00AA
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0xFF0000
  STORE r5, r6
  ADD r5, r5, r1
  LDI r6, 0x880088
  STORE r5, r6
  ADD r5, r5, r1
  CMP r17, r0
  JZ r17, else_0
  ADD r0, r14, r10
  JMP endif_1
else_0:
  LDI r6, 0x48F0AD
  LDI r11, 0x8FC4BD
  LDI r1, 0xA32FFB
  PSETI
  LDI r1, 0x05E538
  LDI r4, 0xFD591F
  LDI r8, 4
  LDI r13, 10
  LDI r11, 16
  RECTF r1, r4, r8, r13, r11
endif_1:
  PUSH r12
  PUSH r14
  PUSH r2
  PUSH r12
  XOR r14, r12, r6
  OR r9, r14, r7
  POP r12
  POP r2
  POP r14
  POP r12
  LDI r13, 256
  LDI r2, 0x509076
  LDI r0, 32
  WPIXEL
  LDI r13, 0x511247
  STORE r13, r12
  LOAD r7, r13
  LDI r8, 0x5593AE
  STORE r8, r15
  LOAD r11, r8
  LDI r13, 128
  STORE r13, r7
  LOAD r11, r13
  LDI r10, 2
  STORE r10, r7
  LOAD r14, r10
  LDI r0, 128
  LDI r22, 0x35107B
  LDI r20, 2
  DRAWTEXT r0, r22, r20, "WORLD"
  LDI r6, 0xE569A9
  LDI r2, 0x0ACEBB
  LDI r0, 256
  LDI r9, 2
  LDI r26, 0x111691
  LINE r6, r2, r0, r9, r26
  LDI r11, 256
  STORE r11, r13
  LOAD r1, r11
  LDI r0, 2
  STORE r0, r11
  LOAD r15, r0
  LDI r13, 128
  STORE r13, r2
  LOAD r15, r13
  PUSH r26
  PUSH r9
  PUSH r8
  PUSH r11
  XOR r5, r10, r2
  OR r11, r10, r6
  XOR r13, r5, r14
  MUL r4, r8, r3
  AND r12, r8, r6
  POP r11
  POP r8
  POP r9
  POP r26
  HALT
