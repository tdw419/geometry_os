; mixed program
; initialization
  LDI r3, 2638
  LDI r9, 0
  LDI r0, 32
  LDI r2, 0x40341C
  LDI r4, 128
  LDI r19, 0xE216B6
; palette
  LDI r14, 0x70D2
  LDI r15, 1
  LDI r4, 0x0044FF
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0x44FF00
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0xFFFFFF
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0xFFFF00
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0x8800FF
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0x0044FF
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0x0000FF
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0xAAAAAA
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0xAAFF00
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0x0044FF
  STORE r14, r4
  ADD r14, r14, r15
  LDI r4, 0x00FF44
  STORE r14, r4
  ADD r14, r14, r15
  LDI r12, 35
loop_0:
  SHL r11, r1, r8
  LDI r25, 1
  SUB r12, r12, r25
  JNZ r12, loop_0
  LDI r14, 16
  LDI r15, 0xCF7043
  LDI r5, 10
  DRAWTEXT r14, r15, r5, "WORLD"
  CMP r16, r0
  HALT
