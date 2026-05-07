; drawing loop program
; initialization
  LDI r4, 936
  LDI r11, 0xAB7C1C
  LDI r13, 4
  LDI r14, 256
  LDI r5, 3967
  LDI r23, 2851
; palette
  LDI r22, 0x709E
  LDI r3, 1
  LDI r7, 0x0000FF
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x444444
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0xFF00FF
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x444444
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x000000
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x444444
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x44FF00
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x8800FF
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x008888
  STORE r22, r7
  ADD r22, r22, r3
  LDI r7, 0x44FF00
  STORE r22, r7
  ADD r22, r22, r3
main_0:
  DIV r7, r15, r24
  SAR r7, r3, r15
  SHL r26, r9, r4
  SAR r15, r5, r2
  SHL r2, r5, r14
  SHR r15, r11, r13
  SAR r12, r4, r2
  SHR r6, r22, r9
  SHLI r1, r11, 1
  SHL r7, r15, r3
  SHLI r7, r9, 255
  SAR r3, r0, r9
  LDI r12, 10
  LDI r13, 0x255078
  LDI r0, 3167
  LDI r0, 3587
  LDI r7, 1253
  LINE r12, r13, r0, r0, r7
  FRAME
  JMP main_0
