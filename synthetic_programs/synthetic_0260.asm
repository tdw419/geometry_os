; Synthetic GeOS Program
; initialization
LDI r21, 132
LDI r2, 0x000000
LDI r2, 498
LDI r24, 166
LDI r23, 287
LDI r13, 5
; arithmetic section
SUB r13, r15, r5
LDI r8, 69
SUB r14, r2, r6
ADD r17, r19, r18
ADD r26, r14, r6
ADD r30, r0, r17
; main loop
loop_0:
  LDI r1, 16776960
  FILL r1
CIRCLE r11, r22, r13, r4
PSET r30, r14, r0
  FRAME
  JMP loop_0