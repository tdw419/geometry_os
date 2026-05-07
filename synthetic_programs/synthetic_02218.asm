; drawing loop program
; initialization
  LDI r12, 2816
  LDI r13, 1700
  LDI r2, 0x15DA62
  LDI r1, 3281
  LDI r8, 3452
  LDI r7, 32
  LDI r11, 0x6544F8
  LDI r6, 2244
; palette
  LDI r0, 0x508D
  LDI r4, 1
  LDI r13, 0x0000FF
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x44FF00
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x880088
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0xFF4400
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x00FFAA
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0xAAFF00
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x0044FF
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x444444
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0xFF0000
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x008888
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0x44FF00
  STORE r0, r13
  ADD r0, r0, r4
  LDI r13, 0xFF4400
  STORE r0, r13
  ADD r0, r0, r4
main_0:
  LDI r2, 0x15B99F
  LDI r5, 16
  LDI r11, 0xCB6835
  DRAWTEXT r2, r5, r11, "WORLD"
  SHL r12, r1, r11
  SHR r11, r7, r4
  SAR r15, r5, r11
  CMP r12, r6
  SHR r15, r11, r2
  SHL r4, r14, r11
  SHL r19, r2, r13
  SHR r3, r23, r11
  SHL r3, r4, r13
  MOD r9, r12, r0
  FRAME
  JMP main_0
