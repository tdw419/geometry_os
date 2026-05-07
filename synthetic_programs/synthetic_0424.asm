; Synthetic GeOS Program
; initialization
LDI r3, 633
LDI r29, 0xFF0000
LDI r24, 377
LDI r11, 658
; arithmetic section
ADD r8, r5, r14
ADD r15, r8, r13
SUB r19, r16, r12
SUB r28, r10, r21
SUB r19, r30, r9
SUB r28, r21, r27
LDI r20, 123
LDI r15, 0x0000FF
; main loop
loop_0:
  LDI r4, 16711935
  FILL r4
LINE r29, r19, r16, r29, r18
LINE r17, r1, r13, r4, r21
PSET r27, r15, r11
  FRAME
  JMP loop_0