; Synthetic GeOS Program
; initialization
LDI r18, 303
LDI r24, 654
LDI r13, 148
LDI r5, 1015
LDI r23, 740
LDI r25, 473
; arithmetic section
SUB r14, r20, r30
ADD r12, r7, r17
SUB r4, r10, r24
; main loop
loop_0:
  LDI r23, 65280
  FILL r23
PSET r22, r4, r15
LINE r26, r31, r11, r19, r8
  CMP r11, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0