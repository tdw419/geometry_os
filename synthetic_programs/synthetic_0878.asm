; Synthetic GeOS Program
; initialization
LDI r14, 131
LDI r13, 379
LDI r9, 474
LDI r23, 202
; arithmetic section
SUB r30, r6, r20
LDI r12, 0xFFFFFF
ADD r25, r11, r19
LDI r22, 760
ADD r29, r3, r7
LDI r17, 92
SUB r19, r11, r10
SUB r8, r8, r15
; main loop
loop_0:
  LDI r22, 0
  FILL r22
LINE r23, r17, r21, r20, r5
CIRCLE r0, r24, r0, r12
  FRAME
  JMP loop_0