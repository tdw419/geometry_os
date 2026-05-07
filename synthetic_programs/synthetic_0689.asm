; Synthetic GeOS Program
; initialization
LDI r31, 677
LDI r18, 748
; arithmetic section
ADD r13, r21, r25
LDI r12, 196
SUB r31, r11, r2
LDI r13, 607
LDI r30, 0xFFFFFF
; main loop
loop_0:
  LDI r6, 16777215
  FILL r6
RECTF r19, r28, r5, r16, r13
  CMP r17, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0