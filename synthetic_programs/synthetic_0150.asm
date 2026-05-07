; Synthetic GeOS Program
; initialization
LDI r11, 818
LDI r21, 192
LDI r3, 244
LDI r28, 756
LDI r2, 655
LDI r17, 0xFF00FF
; arithmetic section
LDI r1, 24
ADD r22, r22, r2
LDI r19, 0x00FFFF
ADD r10, r23, r12
; main loop
loop_0:
  LDI r9, 16777215
  FILL r9
RECTF r8, r18, r4, r26, r3
CIRCLE r4, r19, r4, r20
RECTF r23, r30, r27, r14, r15
  FRAME
  JMP loop_0