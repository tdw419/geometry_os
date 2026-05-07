; Synthetic GeOS Program
; initialization
LDI r15, 843
LDI r15, 1022
LDI r1, 537
LDI r21, 1012
; arithmetic section
LDI r25, 778
LDI r13, 0xFF00FF
SUB r8, r3, r14
ADD r11, r16, r27
LDI r14, 0xFF0000
SUB r10, r18, r20
LDI r4, 34
; main loop
loop_0:
  LDI r25, 16776960
  FILL r25
RECTF r2, r24, r12, r11, r1
PSET r31, r21, r12
  CMP r20, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0