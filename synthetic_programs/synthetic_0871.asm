; Synthetic GeOS Program
; initialization
LDI r28, 376
LDI r19, 0xFFFF00
LDI r22, 402
; main loop
loop_0:
  LDI r1, 0
  FILL r1
PSET r28, r15, r23
  CMP r28, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0