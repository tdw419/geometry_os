; mixed program
; initialization
  LDI r11, 16
  LDI r8, 64
  LDI r3, 10
  LDI r0, 3820
  LDI r9, 2487
  LDI r2, 0
; palette
  LDI r3, 0x8000
  LDI r9, 1
  LDI r11, 0xFF8800
  STORE r3, r11
  ADD r3, r3, r9
  LDI r11, 0x0000FF
  STORE r3, r11
  ADD r3, r3, r9
  LDI r11, 0x888800
  STORE r3, r11
  ADD r3, r3, r9
  LDI r11, 0x0000CC
  STORE r3, r11
  ADD r3, r3, r9
  LDI r4, 1168
  LDI r22, 2382
  LDI r15, 255
  DRAWTEXT r4, r22, r15, "WORLD"
  SHL r9, r5, r10
  SHR r6, r13, r9
  SAR r14, r12, r13
  LDI r10, 2929
  LDI r13, 3778
  LDI r0, 2
  LDI r9, 3056
  LDI r9, 0xC90AA4
  RECTF r10, r13, r0, r9, r9
  CMP r14, r2
  MOD r3, r15, r1
main_0:
  LDI r4, 1117
  LDI r4, 0
  LDI r6, 0x0004AE
  PSETI
  CMPI r3, 0x350BFA
  LDI r14, 2456
  LDI r5, 2132
  LDI r14, 3541
  TEXT r14, r5, r14, "HELLO"
  LDI r7, 0x669469
  LDI r9, 0x3335C7
  LDI r31, 16
  LDI r3, 1213
  LDI r14, 0xC7634A
  RECTF r7, r9, r31, r3, r14
  LDI r14, 0xB59EC2
  LDI r30, 0
  LDI r27, 1726
  LDI r12, 2
  LDI r10, 1147
  LINE r14, r30, r27, r12, r10
  SAR r2, r15, r5
  SAR r10, r11, r12
  SHL r5, r3, r15
  SAR r7, r5, r12
  FRAME
  JMP main_0
