; Synthetic GeOS Program
; initialization
LDI r4, 54
LDI r2, 116
; arithmetic section
LDI r20, 0xFF00FF
LDI r12, 538
SUB r12, r19, r29
ADD r27, r30, r3
ADD r19, r31, r10
SUB r25, r11, r24
LDI r13, 97
; main loop
loop_0:
  LDI r7, 16711935
  FILL r7
LINE r1, r2, r5, r15, r28
CIRCLE r3, r1, r10, r27
RECTF r8, r13, r31, r4, r23
  CMP r2, r9
  JZ r0, loop_0
  FRAME
  JMP loop_0