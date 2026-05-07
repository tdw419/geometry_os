; Synthetic GeOS Program
; initialization
LDI r21, 827
LDI r25, 585
LDI r6, 767
LDI r4, 0x888888
LDI r0, 651
LDI r20, 799
; arithmetic section
SUB r10, r31, r18
SUB r21, r1, r19
ADD r13, r8, r20
LDI r4, 206
SUB r24, r11, r30
ADD r14, r16, r15
; main loop
loop_0:
  LDI r23, 16776960
  FILL r23
PSET r21, r7, r21
CIRCLE r31, r11, r19, r18
PSET r30, r16, r27
  CMP r7, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0