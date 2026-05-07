; Synthetic GeOS Program
; initialization
LDI r19, 769
LDI r15, 898
LDI r8, 571
; main loop
loop_0:
  LDI r14, 8947848
  FILL r14
PSET r28, r11, r23
CIRCLE r30, r17, r16, r29
PSET r25, r20, r29
  CMP r24, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0