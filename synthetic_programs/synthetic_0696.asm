; Synthetic GeOS Program
; initialization
LDI r12, 102
LDI r22, 0xFFFFFF
; arithmetic section
ADD r29, r23, r7
LDI r20, 403
LDI r18, 457
ADD r26, r30, r25
; main loop
loop_0:
  LDI r12, 16777215
  FILL r12
CIRCLE r17, r16, r21, r21
  CMP r27, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0