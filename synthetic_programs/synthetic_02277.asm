; mixed program
; initialization
  LDI r16, 1136
  LDI r10, 1846
; palette
  LDI r11, 0x6032
  LDI r2, 1
  LDI r14, 0x880088
  STORE r11, r14
  ADD r11, r11, r2
  LDI r14, 0x0044FF
  STORE r11, r14
  ADD r11, r11, r2
  LDI r14, 0xFF4400
  STORE r11, r14
  ADD r11, r11, r2
  LDI r14, 0x00FFFF
  STORE r11, r14
  ADD r11, r11, r2
  LDI r14, 0x0044FF
  STORE r11, r14
  ADD r11, r11, r2
  LDI r14, 0xAAAAAA
  STORE r11, r14
  ADD r11, r11, r2
  CMP r10, r5
  JNZ r10, else_0
  AND r0, r9, r13
  SHL r6, r14, r1
  JMP endif_1
else_0:
  LDI r2, 1326
  LDI r14, 256
  LDI r15, 255
  LDI r13, 0xD4D313
  LDI r3, 928
  RECTF r2, r14, r15, r13, r3
  LDI r3, 819
  LDI r1, 3080
  LDI r14, 3887
  PSET r3, r1, r14
  LDI r2, 3666
  LDI r13, 64
  LDI r8, 10
  WPIXEL
  LDI r10, 0x15C42B
  LDI r9, 128
  LDI r4, 1788
  LDI r0, 128
  LDI r4, 4
  RECTF r10, r9, r4, r0, r4
endif_1:
  SHL r11, r0, r1
  SHLI r10, r5, 0x8714E3
  SHLI r0, r10, 6
  PUSH r4
  MOD r17, r6, r9
  XOR r6, r13, r15
  ADD r15, r5, r1
  POP r4
  SAR r4, r6, r0
  SHLI r29, r2, 7
  SHL r1, r6, r4
  SHR r7, r6, r3
main_2:
  AND r11, r9, r0
  XOR r6, r10, r11
  XOR r6, r9, r4
  SHL r3, r2, r1
  SAR r1, r6, r2
  SHL r6, r4, r12
  CMPI r12, 150
  CMPI r3, 0xB55A29
  SAR r3, r12, r4
  SHL r6, r23, r2
  SHL r4, r7, r12
  FRAME
  JMP main_2
