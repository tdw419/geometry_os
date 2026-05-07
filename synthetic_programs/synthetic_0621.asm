; Synthetic GeOS Program
; initialization
LDI r7, 82
LDI r17, 116
LDI r16, 0x00FF00
LDI r9, 273
LDI r7, 1007
LDI r6, 0x0000FF
; main loop
loop_0:
  LDI r12, 16777215
  FILL r12
RECTF r4, r22, r27, r29, r18
CIRCLE r27, r0, r20, r19
PSET r30, r6, r0
  CMP r15, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0