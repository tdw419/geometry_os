; Synthetic GeOS Program
; initialization
LDI r22, 701
LDI r17, 442
LDI r14, 0xFF00FF
LDI r6, 320
LDI r4, 0x000000
; main loop
loop_0:
  LDI r21, 255
  FILL r21
CIRCLE r2, r13, r26, r15
LINE r9, r22, r19, r16, r11
PSET r11, r0, r11
  CMP r18, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0