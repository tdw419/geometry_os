; Synthetic GeOS Program
; initialization
LDI r19, 306
LDI r18, 745
LDI r19, 953
LDI r18, 354
LDI r4, 318
LDI r11, 162
; main loop
loop_0:
  LDI r13, 255
  FILL r13
RECTF r19, r15, r4, r15, r17
LINE r23, r20, r16, r10, r15
  CMP r15, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0