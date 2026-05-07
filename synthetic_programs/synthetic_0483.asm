; Synthetic GeOS Program
; initialization
LDI r1, 234
LDI r15, 895
LDI r15, 291
LDI r27, 50
; main loop
loop_0:
  LDI r16, 16776960
  FILL r16
CIRCLE r16, r7, r16, r20
  CMP r1, r9
  JZ r0, loop_0
  FRAME
  JMP loop_0