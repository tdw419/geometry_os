; Synthetic GeOS Program
; initialization
LDI r21, 46
LDI r31, 299
; main loop
loop_0:
  LDI r9, 16711680
  FILL r9
RECTF r30, r11, r3, r19, r25
PSET r2, r21, r16
  CMP r21, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0