; mixed program
; initialization
  LDI r2, 0
  LDI r15, 256
  LDI r10, 8
; palette
  LDI r11, 0x4051
  LDI r10, 1
  LDI r2, 0xAA00AA
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0xFFEE00
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0x000000
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0xFF00FF
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0x0000FF
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0x008888
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0x000000
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0x00FF44
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0x444444
  STORE r11, r2
  ADD r11, r11, r10
  LDI r2, 0xDD0044
  STORE r11, r2
  ADD r11, r11, r10
  SHR r1, r10, r6
  SHR r10, r1, r15
  SHLI r13, r15, 4
  SAR r9, r4, r10
  PUSH r8
  ADD r3, r11, r12
  ADD r2, r7, r4
  MOD r12, r2, r8
  SHR r6, r13, r11
  POP r8
  CMP r13, r11
  JZ r13, else_0
  MOD r14, r10, r5
  OR r11, r2, r12
  JMP endif_1
else_0:
  LDI r6, 8
  FILL r6
  LDI r15, 3637
  LDI r2, 3310
  LDI r2, 0x1C4AEC
  WPIXEL
endif_1:
main_2:
  CMP r8, r5
  ADDI r11, r5, 8
  SHR r13, r10, r5
  SAR r6, r7, r11
  FRAME
  JMP main_2
