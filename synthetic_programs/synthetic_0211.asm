; Synthetic GeOS Program
; initialization
LDI r16, 598
LDI r27, 285
LDI r9, 198
LDI r21, 600
; arithmetic section
SUB r11, r18, r26
ADD r31, r24, r1
ADD r8, r25, r14
LDI r20, 188
ADD r2, r21, r23
; main loop
loop_0:
  LDI r0, 16776960
  FILL r0
PSET r31, r7, r10
  FRAME
  JMP loop_0