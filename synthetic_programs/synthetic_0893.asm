; Synthetic GeOS Program
; initialization
LDI r5, 0x000000
LDI r12, 0x00FF00
LDI r0, 644
LDI r18, 920
LDI r20, 94
; arithmetic section
SUB r21, r27, r22
ADD r11, r7, r13
SUB r14, r18, r23
ADD r6, r5, r7
LDI r9, 760
SUB r5, r13, r23
LDI r26, 721
; main loop
loop_0:
  LDI r21, 255
  FILL r21
PSET r31, r14, r22
PSET r3, r8, r27
  FRAME
  JMP loop_0