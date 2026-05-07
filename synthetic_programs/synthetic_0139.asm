; Synthetic GeOS Program
; initialization
LDI r12, 283
LDI r3, 0x0000FF
LDI r25, 864
; main loop
loop_0:
  LDI r14, 16777215
  FILL r14
CIRCLE r17, r14, r18, r20
LINE r6, r26, r4, r29, r9
PSET r10, r31, r7
  FRAME
  JMP loop_0