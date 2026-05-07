; drawing loop program
; initialization
  LDI r13, 0xE4049B
  LDI r7, 0x4B2DCF
  LDI r0, 0x8E4A70
  LDI r6, 255
  LDI r20, 4
; palette
  LDI r8, 0x60B4
  LDI r3, 1
  LDI r14, 0xFFFFFF
  STORE r8, r14
  ADD r8, r8, r3
  LDI r14, 0x0044FF
  STORE r8, r14
  ADD r8, r8, r3
  LDI r14, 0x0000FF
  STORE r8, r14
  ADD r8, r8, r3
  LDI r14, 0x000000
  STORE r8, r14
  ADD r8, r8, r3
  LDI r14, 0x00FF44
  STORE r8, r14
  ADD r8, r8, r3
  LDI r14, 0xFFEE00
  STORE r8, r14
  ADD r8, r8, r3
  LDI r14, 0x0000FF
  STORE r8, r14
  ADD r8, r8, r3
main_0:
  SHLI r2, r9, 8
  SHLI r0, r15, 5
  SHL r14, r5, r3
  ANDI r0, r1, 0x1FBE03
  LDI r13, 8
  LDI r8, 0
  LDI r0, 0
  TEXT r13, r8, r0, "HELLO"
  OR r9, r13, r11
  AND r8, r12, r0
  OR r9, r12, r14
  XOR r9, r11, r10
  FRAME
  JMP main_0
