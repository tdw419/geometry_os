; Synthetic GeOS Program
; initialization
LDI r30, 0x0000FF
LDI r18, 324
LDI r27, 68
; arithmetic section
SUB r16, r25, r2
SUB r10, r2, r21
SUB r12, r20, r29
SUB r26, r14, r23
SUB r12, r25, r1
SUB r0, r25, r12
LDI r28, 699
; main loop
loop_0:
  LDI r10, 16776960
  FILL r10
CIRCLE r24, r8, r0, r2
RECTF r28, r1, r16, r24, r1
LINE r9, r3, r16, r14, r18
  FRAME
  JMP loop_0