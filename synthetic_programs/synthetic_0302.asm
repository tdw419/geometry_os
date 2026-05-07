; Synthetic GeOS Program
; initialization
LDI r9, 162
LDI r3, 889
LDI r21, 922
LDI r6, 998
; arithmetic section
SUB r30, r8, r16
SUB r27, r8, r7
LDI r25, 810
ADD r11, r25, r14
LDI r19, 242
ADD r26, r11, r29
ADD r24, r1, r26
; main loop
loop_0:
  LDI r14, 16776960
  FILL r14
LINE r13, r13, r6, r24, r12
  FRAME
  JMP loop_0