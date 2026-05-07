; drawing loop program
; initialization
  LDI r2, 2
  LDI r11, 128
  LDI r10, 64
; palette
  LDI r12, 0x7038
  LDI r4, 1
  LDI r1, 0xFFFF00
  STORE r12, r1
  ADD r12, r12, r4
  LDI r1, 0x550077
  STORE r12, r1
  ADD r12, r12, r4
  LDI r1, 0xFF4400
  STORE r12, r1
  ADD r12, r12, r4
  LDI r1, 0x550077
  STORE r12, r1
  ADD r12, r12, r4
main_0:
  SUB r4, r3, r11
  MUL r2, r14, r8
  CMPI r1, 32
  DIV r0, r12, r2
  LDI r11, 0xF953FE
  FILL r11
  LDI r12, 16
  LDI r14, 4077
  LDI r12, 3784
  WPIXEL
  FRAME
  JMP main_0
