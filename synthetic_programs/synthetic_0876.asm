; Synthetic GeOS Program
; initialization
LDI r22, 974
LDI r19, 461
LDI r7, 583
LDI r25, 94
LDI r19, 0x000000
LDI r6, 0x00FFFF
; main loop
loop_0:
  LDI r2, 8947848
  FILL r2
RECTF r15, r29, r7, r24, r24
PSET r25, r12, r29
  CMP r5, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0