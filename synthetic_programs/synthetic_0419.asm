; Synthetic GeOS Program
; initialization
LDI r25, 98
LDI r21, 183
LDI r4, 781
; arithmetic section
SUB r9, r16, r22
LDI r31, 891
SUB r24, r5, r7
; main loop
loop_0:
  LDI r27, 16776960
  FILL r27
RECTF r12, r9, r4, r8, r1
  CMP r9, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0