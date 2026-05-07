; Synthetic GeOS Program
; initialization
LDI r13, 711
LDI r12, 927
LDI r11, 598
LDI r23, 923
; arithmetic section
LDI r29, 433
SUB r25, r19, r2
LDI r25, 853
ADD r10, r15, r11
ADD r11, r15, r24
; main loop
loop_0:
  LDI r14, 16776960
  FILL r14
CIRCLE r4, r4, r26, r14
  CMP r8, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0