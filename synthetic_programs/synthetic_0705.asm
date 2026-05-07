; Synthetic GeOS Program
; initialization
LDI r5, 783
LDI r7, 22
LDI r18, 0xFF00FF
LDI r26, 981
; main loop
loop_0:
  LDI r30, 16711935
  FILL r30
CIRCLE r12, r29, r31, r3
LINE r27, r21, r24, r4, r23
CIRCLE r25, r12, r13, r26
  CMP r7, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0