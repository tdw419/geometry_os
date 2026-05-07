; Synthetic GeOS Program
; initialization
LDI r0, 437
LDI r31, 964
LDI r27, 13
; arithmetic section
SUB r13, r1, r27
LDI r14, 959
LDI r10, 121
LDI r18, 408
LDI r25, 156
SUB r20, r1, r16
ADD r11, r0, r30
ADD r3, r21, r14
; main loop
loop_0:
  LDI r20, 255
  FILL r20
PSET r3, r7, r19
  FRAME
  JMP loop_0