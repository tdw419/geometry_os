; Synthetic GeOS Program
; initialization
LDI r24, 0xFF0000
LDI r9, 0x888888
LDI r13, 96
LDI r3, 849
LDI r3, 0x888888
; arithmetic section
ADD r11, r26, r10
SUB r21, r12, r31
SUB r9, r23, r25
; main loop
loop_0:
  LDI r30, 65280
  FILL r30
RECTF r22, r9, r9, r22, r7
  FRAME
  JMP loop_0