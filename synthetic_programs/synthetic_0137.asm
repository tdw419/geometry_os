; Synthetic GeOS Program
; initialization
LDI r14, 360
LDI r12, 0xFF00FF
; main loop
loop_0:
  LDI r3, 65280
  FILL r3
PSET r22, r20, r6
CIRCLE r16, r15, r21, r30
  CMP r26, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0