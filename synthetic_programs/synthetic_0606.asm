; Synthetic GeOS Program
; initialization
LDI r3, 321
LDI r5, 909
LDI r26, 0x888888
LDI r9, 3
LDI r5, 947
; arithmetic section
SUB r0, r12, r29
SUB r7, r0, r28
ADD r11, r21, r1
; main loop
loop_0:
  LDI r6, 16776960
  FILL r6
CIRCLE r27, r6, r25, r10
PSET r21, r21, r0
  FRAME
  JMP loop_0