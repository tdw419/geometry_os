; Synthetic GeOS Program
; initialization
LDI r27, 0x00FFFF
LDI r2, 0xFF00FF
LDI r27, 985
; main loop
loop_0:
  LDI r5, 16711680
  FILL r5
LINE r29, r10, r15, r14, r27
CIRCLE r8, r24, r16, r15
PSET r6, r10, r25
  CMP r10, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0