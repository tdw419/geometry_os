; Synthetic GeOS Program
; initialization
LDI r28, 978
LDI r23, 0x000000
; main loop
loop_0:
  LDI r9, 65280
  FILL r9
PSET r25, r27, r24
RECTF r28, r19, r14, r3, r17
LINE r29, r21, r13, r13, r16
  CMP r12, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0