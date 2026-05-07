; Synthetic GeOS Program
; initialization
LDI r14, 0x00FFFF
LDI r24, 0x000000
LDI r27, 274
LDI r20, 186
LDI r15, 924
; main loop
loop_0:
  LDI r23, 65280
  FILL r23
LINE r27, r22, r26, r19, r22
CIRCLE r27, r29, r9, r18
  CMP r2, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0