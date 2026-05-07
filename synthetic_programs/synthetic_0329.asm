; Synthetic GeOS Program
; initialization
LDI r8, 332
LDI r21, 969
; arithmetic section
LDI r3, 0xFF00FF
SUB r24, r16, r17
LDI r29, 0xFF0000
SUB r22, r10, r25
; main loop
loop_0:
  LDI r0, 16776960
  FILL r0
LINE r13, r8, r6, r25, r3
CIRCLE r8, r5, r31, r27
  CMP r24, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0