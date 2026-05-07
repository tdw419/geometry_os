; Synthetic GeOS Program
; initialization
LDI r21, 146
LDI r17, 185
LDI r14, 655
; arithmetic section
SUB r8, r21, r19
SUB r7, r25, r22
SUB r10, r25, r29
ADD r14, r30, r14
LDI r4, 2
ADD r15, r28, r18
SUB r25, r6, r4
; main loop
loop_0:
  LDI r24, 16776960
  FILL r24
PSET r26, r11, r10
  CMP r0, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0