; Synthetic GeOS Program
; initialization
LDI r29, 0x0000FF
LDI r30, 489
LDI r19, 0xFF0000
LDI r18, 690
; main loop
loop_0:
  LDI r22, 8947848
  FILL r22
PSET r19, r10, r26
  CMP r12, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0