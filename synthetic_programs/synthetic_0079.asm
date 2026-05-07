; Synthetic GeOS Program
; initialization
LDI r12, 672
LDI r27, 677
LDI r4, 132
LDI r3, 113
LDI r16, 521
LDI r22, 605
; arithmetic section
LDI r5, 219
ADD r23, r17, r24
SUB r31, r17, r15
LDI r20, 64
ADD r26, r3, r25
; main loop
loop_0:
  LDI r14, 255
  FILL r14
CIRCLE r19, r23, r27, r11
LINE r24, r4, r24, r24, r0
PSET r1, r13, r1
  CMP r26, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0