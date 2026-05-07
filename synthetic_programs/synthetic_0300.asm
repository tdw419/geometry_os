; Synthetic GeOS Program
; initialization
LDI r0, 531
LDI r19, 0x0000FF
LDI r24, 675
LDI r12, 0x00FFFF
LDI r21, 712
LDI r22, 841
; arithmetic section
ADD r19, r20, r16
ADD r13, r3, r12
LDI r24, 0xFFFFFF
ADD r16, r7, r16
; main loop
loop_0:
  LDI r7, 255
  FILL r7
CIRCLE r13, r5, r8, r14
RECTF r16, r22, r5, r14, r19
  CMP r4, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0