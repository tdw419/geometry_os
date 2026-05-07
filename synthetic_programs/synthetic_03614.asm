; mixed program
; initialization
  LDI r10, 128
  LDI r2, 64
; palette
  LDI r4, 0x2486
  LDI r13, 1
  LDI r8, 0x000066
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x00AAFF
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x00FF00
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x0000CC
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0xFFFFFF
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x550077
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x00FF00
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x8800FF
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x008888
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0xAAFF00
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x880088
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x0000FF
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x0000CC
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0x0044FF
  STORE r4, r8
  ADD r4, r4, r13
  LDI r8, 0xFFFFFF
  STORE r4, r8
  ADD r4, r4, r13
  PUSH r13
  PUSH r1
  DIV r3, r25, r4
  SHR r2, r10, r8
  SHR r12, r11, r4
  POP r1
  POP r13
  PUSH r13
  PUSH r12
  OR r5, r2, r14
  MOD r13, r5, r8
  SHL r13, r8, r24
  POP r12
  POP r13
  CMP r14, r10
  JZ r14, else_0
  OR r8, r14, r5
  SHR r14, r1, r13
  DIV r0, r4, r14
  AND r6, r14, r12
  JMP endif_1
else_0:
  LDI r14, 2889
  LDI r12, 3492
  LDI r6, 10
  LDI r6, 1998
  LDI r10, 8
  RECTF r14, r12, r6, r6, r10
  LDI r10, 128
  LDI r9, 64
  LDI r11, 0x6F81FA
  LDI r3, 255
  CIRCLE r10, r9, r11, r3
  LDI r12, 2
  FILL r12
  LDI r10, 8
  LDI r10, 4
  LDI r12, 0x0C879D
  PSET r10, r10, r12
endif_1:
  LDI r11, 1
  LDI r15, 1546
  LDI r2, 0x17E3B4
  DRAWTEXT r11, r15, r2, "WORLD"
  CMP r8, r4
  JNZ r8, else_2
  SHL r14, r15, r7
  SHR r8, r12, r7
  JMP endif_3
else_2:
  LDI r9, 2217
  LDI r7, 16
  LDI r6, 3834
  WPIXEL
  LDI r5, 16
  LDI r15, 16
  LDI r0, 128
  PSET r5, r15, r0
  LDI r5, 2892
  LDI r10, 64
  LDI r5, 0x8AD694
  LDI r3, 256
  LDI r9, 1656
  RECTF r5, r10, r5, r3, r9
endif_3:
  HALT
