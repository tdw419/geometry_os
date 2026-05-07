; Synthetic GeOS Program
; initialization
LDI r2, 102
LDI r5, 592
LDI r21, 0xFF00FF
LDI r31, 174
LDI r7, 632
LDI r16, 0xFFFFFF
; arithmetic section
LDI r6, 965
SUB r1, r1, r7
ADD r22, r4, r14
; main loop
loop_0:
  LDI r4, 255
  FILL r4
LINE r11, r15, r7, r16, r3
CIRCLE r1, r4, r6, r5
  CMP r11, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0