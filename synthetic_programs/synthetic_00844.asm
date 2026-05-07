; mixed program
; initialization
  LDI r14, 0x47586B
  LDI r11, 2
  LDI r8, 2
  LDI r10, 128
  LDI r9, 256
  LDI r4, 3444
  LDI r15, 2727
  LDI r6, 46
loop_0:
  OR r12, r8, r2
  SHR r6, r7, r12
  LDI r0, 2
  LDI r25, 0x323E67
  LDI r14, 0x93638D
  LDI r8, 255
  LDI r4, 1818
  LINE r0, r25, r14, r8, r4
  LDI r9, 1
  SUB r6, r6, r9
  JNZ r6, loop_0
  LDI r3, 2415
  STORE r3, r2
  LOAD r15, r3
  LDI r25, 4
  STORE r25, r0
  LOAD r7, r25
  LDI r3, 0
  LDI r7, 3239
  LDI r11, 4048
  PSET r3, r7, r11
  XOR r9, r0, r3
  OR r14, r0, r2
  OR r9, r6, r11
  HALT
