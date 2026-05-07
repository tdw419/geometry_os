; drawing loop program
; initialization
  LDI r10, 1010
  LDI r4, 0x690307
  LDI r1, 3462
  LDI r15, 1776
  LDI r12, 255
  LDI r0, 490
  LDI r9, 0x30E42B
  LDI r7, 0x8D0DBC
; palette
  LDI r3, 0x2467
  LDI r8, 1
  LDI r0, 0x00FF44
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0x0000CC
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0xDD0044
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0x550077
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0xFF00FF
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0x008888
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0x00FFFF
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0x00FF00
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0xAAAAAA
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0xFF00FF
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0xFF4400
  STORE r3, r0
  ADD r3, r3, r8
  LDI r0, 0x0000FF
  STORE r3, r0
  ADD r3, r3, r8
main_0:
  ADDI r11, r9, 4
  SAR r3, r4, r12
  SAR r7, r5, r6
  ANDI r13, r24, 255
  SHL r22, r11, r13
  SAR r5, r23, r8
  SAR r8, r0, r9
  FRAME
  JMP main_0
