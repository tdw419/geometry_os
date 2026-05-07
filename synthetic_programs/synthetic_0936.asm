; Synthetic GeOS Program
; initialization
LDI r25, 297
LDI r24, 772
; arithmetic section
ADD r14, r29, r26
LDI r10, 947
SUB r28, r13, r10
SUB r26, r26, r5
LDI r26, 580
ADD r19, r14, r13
SUB r6, r13, r16
; main loop
loop_0:
  LDI r13, 0
  FILL r13
CIRCLE r7, r17, r9, r12
PSET r7, r12, r0
  CMP r24, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0