; Synthetic GeOS Program
; initialization
LDI r30, 116
LDI r22, 550
LDI r19, 130
LDI r16, 156
LDI r3, 69
; arithmetic section
ADD r23, r19, r7
LDI r3, 36
ADD r19, r13, r29
ADD r28, r29, r21
LDI r19, 88
ADD r24, r16, r16
SUB r16, r19, r0
; main loop
loop_0:
  LDI r2, 255
  FILL r2
CIRCLE r9, r30, r18, r20
  CMP r26, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0