; mixed program
; initialization
  LDI r0, 3895
  LDI r12, 0x496595
  LDI r15, 0xC01F4C
  LDI r8, 10
  LDI r10, 32
  LDI r4, 0x8CB273
  LDI r7, 256
  LDI r1, 8
; palette
  LDI r8, 0x8071
  LDI r9, 1
  LDI r2, 0x000000
  STORE r8, r2
  ADD r8, r8, r9
  LDI r2, 0xAAFF00
  STORE r8, r2
  ADD r8, r8, r9
  LDI r2, 0x000066
  STORE r8, r2
  ADD r8, r8, r9
  LDI r2, 0x0000FF
  STORE r8, r2
  ADD r8, r8, r9
  LDI r2, 0xFF4400
  STORE r8, r2
  ADD r8, r8, r9
  LDI r2, 0xFF4400
  STORE r8, r2
  ADD r8, r8, r9
  LDI r2, 0xFFFFFF
  STORE r8, r2
  ADD r8, r8, r9
  LDI r1, 0xE09827
  FILL r1
  LDI r1, 0x7356A5
  STORE r1, r3
  LOAD r15, r1
  LDI r11, 2736
  STORE r11, r13
  LOAD r3, r11
  SHR r6, r0, r12
  SHL r15, r14, r5
  SHR r14, r10, r9
  AND r8, r3, r11
  OR r6, r11, r5
  SHR r6, r4, r2
  SHLI r1, r5, 4
  SAR r11, r0, r15
  SAR r14, r10, r5
  HALT
