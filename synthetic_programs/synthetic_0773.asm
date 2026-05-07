; Synthetic GeOS Program
; initialization
LDI r17, 756
LDI r24, 722
LDI r20, 495
; arithmetic section
ADD r4, r15, r29
LDI r31, 984
LDI r17, 535
LDI r19, 0x00FF00
LDI r10, 134
ADD r0, r11, r26
LDI r1, 0xFF0000
; main loop
loop_0:
  LDI r21, 16711935
  FILL r21
RECTF r13, r23, r29, r2, r19
PSET r26, r9, r30
PSET r9, r11, r13
  FRAME
  JMP loop_0