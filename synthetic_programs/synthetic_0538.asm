; Synthetic GeOS Program
; initialization
LDI r0, 877
LDI r14, 3
LDI r14, 242
LDI r2, 500
LDI r5, 488
LDI r6, 787
; arithmetic section
ADD r0, r16, r27
ADD r24, r17, r30
SUB r31, r3, r6
LDI r28, 404
SUB r18, r10, r24
SUB r1, r12, r19
LDI r28, 361
; main loop
loop_0:
  LDI r25, 255
  FILL r25
CIRCLE r4, r20, r28, r1
  FRAME
  JMP loop_0