; Synthetic GeOS Program
; initialization
LDI r30, 385
LDI r24, 0x0000FF
; main loop
loop_0:
  LDI r16, 16777215
  FILL r16
CIRCLE r17, r12, r10, r16
RECTF r20, r6, r31, r24, r15
LINE r22, r10, r24, r19, r29
  CMP r13, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0