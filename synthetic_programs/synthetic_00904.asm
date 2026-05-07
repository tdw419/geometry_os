; mixed program
; initialization
  LDI r12, 255
  LDI r9, 3259
  LDI r6, 16
  LDI r11, 1
  LDI r2, 0x7D3263
  LDI r14, 0xEA8F22
; palette
  LDI r9, 0x70C6
  LDI r6, 1
  LDI r3, 0x008888
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0x44FF00
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0x8800FF
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0xFF0000
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0xFF00FF
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0xFF4400
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0x0000FF
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0x000066
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0xAAAAAA
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0xFF4400
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0x00FFFF
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0xFFFFFF
  STORE r9, r3
  ADD r9, r9, r6
  LDI r3, 0x44FF00
  STORE r9, r3
  ADD r9, r9, r6
  CMP r3, r9
  JZ r3, else_0
  SHL r10, r24, r8
  SUB r0, r3, r12
  ADD r9, r7, r4
  JMP endif_1
else_0:
  LDI r12, 4
  FILL r12
endif_1:
  LDI r10, 644
  LDI r2, 16
  LDI r14, 256
  DRAWTEXT r10, r2, r14, "WORLD"
  LDI r5, 3299
  LDI r15, 0xB1CD5F
  LDI r9, 0x85E272
  DRAWTEXT r5, r15, r9, "WORLD"
  XOR r5, r6, r23
  AND r4, r0, r14
  AND r12, r11, r5
  HALT
