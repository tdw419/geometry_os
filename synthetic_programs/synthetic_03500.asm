; drawing loop program
; initialization
  LDI r4, 0x1BA90B
  LDI r11, 3716
; palette
  LDI r14, 0x5071
  LDI r11, 1
  LDI r4, 0x0000CC
  STORE r14, r4
  ADD r14, r14, r11
  LDI r4, 0x00FF00
  STORE r14, r4
  ADD r14, r14, r11
  LDI r4, 0x00FF00
  STORE r14, r4
  ADD r14, r14, r11
  LDI r4, 0xFF4400
  STORE r14, r4
  ADD r14, r14, r11
  LDI r4, 0xFF4400
  STORE r14, r4
  ADD r14, r14, r11
  LDI r4, 0x444444
  STORE r14, r4
  ADD r14, r14, r11
main_0:
  LDI r12, 128
  LDI r4, 2432
  LDI r27, 0x102DA1
  TEXT r12, r4, r27, "HELLO"
  ADDI r10, r1, 0xD5C55B
  XOR r8, r7, r4
  XOR r15, r4, r3
  OR r11, r3, r7
  OR r11, r8, r13
  XOR r8, r7, r3
  XOR r1, r14, r13
  AND r10, r5, r8
  FRAME
  JMP main_0
