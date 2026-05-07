; Synthetic GeOS Program
; initialization
LDI r3, 809
LDI r5, 499
LDI r13, 0x00FFFF
LDI r3, 274
LDI r16, 963
LDI r26, 0x0000FF
; main loop
loop_0:
  LDI r27, 8947848
  FILL r27
PSET r29, r19, r9
RECTF r24, r29, r20, r4, r17
PSET r25, r4, r4
  CMP r8, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0