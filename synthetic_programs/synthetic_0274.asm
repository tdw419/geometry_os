; Synthetic GeOS Program
; initialization
LDI r27, 407
LDI r22, 130
LDI r8, 373
LDI r1, 0x00FF00
; arithmetic section
SUB r2, r31, r17
SUB r10, r19, r4
LDI r5, 229
ADD r18, r3, r15
SUB r12, r15, r14
; main loop
loop_0:
  LDI r7, 16777215
  FILL r7
PSET r11, r23, r10
  FRAME
  JMP loop_0