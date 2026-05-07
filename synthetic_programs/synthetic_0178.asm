; Synthetic GeOS Program
; initialization
LDI r26, 434
LDI r23, 838
LDI r24, 973
LDI r11, 20
; arithmetic section
ADD r29, r19, r10
ADD r13, r4, r17
LDI r1, 958
ADD r30, r18, r3
; main loop
loop_0:
  LDI r13, 65535
  FILL r13
CIRCLE r30, r9, r9, r1
RECTF r1, r9, r19, r24, r1
CIRCLE r11, r12, r16, r22
  FRAME
  JMP loop_0