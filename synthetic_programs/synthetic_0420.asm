; Synthetic GeOS Program
; initialization
LDI r12, 785
LDI r0, 1010
; arithmetic section
LDI r25, 435
ADD r29, r15, r23
ADD r13, r16, r6
; main loop
loop_0:
  LDI r5, 16776960
  FILL r5
LINE r5, r24, r20, r14, r27
LINE r3, r17, r30, r3, r23
CIRCLE r14, r18, r6, r14
  CMP r10, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0