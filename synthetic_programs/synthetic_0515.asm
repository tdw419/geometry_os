; Synthetic GeOS Program
; initialization
LDI r25, 755
LDI r21, 539
LDI r15, 766
; arithmetic section
SUB r1, r2, r28
ADD r29, r2, r30
LDI r15, 0xFFFFFF
LDI r15, 0xFF00FF
SUB r22, r11, r21
; main loop
loop_0:
  LDI r9, 16711935
  FILL r9
LINE r28, r0, r9, r19, r18
RECTF r30, r18, r18, r10, r28
  CMP r0, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0