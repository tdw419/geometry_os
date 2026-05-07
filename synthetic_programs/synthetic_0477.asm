; Synthetic GeOS Program
; initialization
LDI r31, 625
LDI r16, 134
LDI r27, 0x00FFFF
LDI r19, 615
; main loop
loop_0:
  LDI r28, 65535
  FILL r28
PSET r2, r10, r31
CIRCLE r24, r20, r9, r5
LINE r27, r23, r9, r1, r29
  FRAME
  JMP loop_0