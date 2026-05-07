; Synthetic GeOS Program
; initialization
LDI r24, 5
LDI r16, 0xFFFF00
; arithmetic section
LDI r10, 0xFF00FF
SUB r8, r15, r5
ADD r3, r14, r13
LDI r30, 89
; main loop
loop_0:
  LDI r14, 0
  FILL r14
PSET r11, r12, r23
CIRCLE r10, r22, r14, r17
CIRCLE r5, r22, r16, r4
  FRAME
  JMP loop_0