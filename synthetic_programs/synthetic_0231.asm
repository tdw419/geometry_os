; Synthetic GeOS Program
; initialization
LDI r5, 587
LDI r6, 696
LDI r24, 624
LDI r15, 875
; main loop
loop_0:
  LDI r26, 65535
  FILL r26
LINE r25, r13, r11, r21, r14
LINE r7, r11, r29, r16, r4
CIRCLE r20, r4, r8, r12
  CMP r8, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0