; Synthetic GeOS Program
; initialization
LDI r6, 300
LDI r11, 5
LDI r14, 620
LDI r0, 729
LDI r20, 135
; arithmetic section
ADD r6, r16, r25
ADD r13, r1, r13
LDI r0, 0xFFFF00
; main loop
loop_0:
  LDI r4, 16776960
  FILL r4
RECTF r17, r9, r6, r1, r2
RECTF r14, r14, r30, r16, r22
RECTF r22, r17, r8, r27, r0
  FRAME
  JMP loop_0