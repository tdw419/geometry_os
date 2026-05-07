; Synthetic GeOS Program
; initialization
LDI r11, 453
LDI r16, 189
LDI r8, 375
LDI r16, 418
LDI r27, 837
; arithmetic section
LDI r19, 879
SUB r21, r2, r7
ADD r19, r2, r15
ADD r20, r23, r15
SUB r12, r12, r25
ADD r8, r24, r10
LDI r23, 16
; main loop
loop_0:
  LDI r1, 0
  FILL r1
CIRCLE r9, r11, r17, r28
  CMP r13, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0