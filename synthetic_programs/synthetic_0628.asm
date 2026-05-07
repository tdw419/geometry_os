; Synthetic GeOS Program
; initialization
LDI r25, 0x000000
LDI r29, 541
LDI r23, 947
LDI r14, 493
LDI r31, 0x00FF00
; main loop
loop_0:
  LDI r8, 65280
  FILL r8
CIRCLE r24, r16, r7, r13
  CMP r15, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0