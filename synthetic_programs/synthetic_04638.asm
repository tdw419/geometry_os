; mixed program
; initialization
  LDI r7, 0x250737
  LDI r5, 1165
  LDI r22, 0xAC12F4
  LDI r10, 1171
  LDI r9, 181
  LDI r11, 10
  XOR r1, r11, r3
  XOR r7, r3, r13
  LDI r11, 2660
  LDI r11, 0
  LDI r6, 0xF61DFA
  LDI r16, 0xDE4868
  LDI r0, 4
  RECTF r11, r11, r6, r16, r0
main_0:
  ADD r13, r0, r3
  OR r4, r0, r2
  FRAME
  JMP main_0
