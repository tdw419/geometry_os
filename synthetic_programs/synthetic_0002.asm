; Synthetic GeOS Program
; initialization
LDI r28, 722
LDI r7, 105
LDI r26, 498
LDI r7, 146
; arithmetic section
ADD r22, r11, r28
ADD r18, r21, r5
ADD r28, r8, r3
ADD r13, r29, r23
ADD r20, r0, r25
; main loop
loop_0:
  LDI r16, 8947848
  FILL r16
PSET r31, r26, r11
LINE r27, r19, r21, r15, r29
  FRAME
  JMP loop_0