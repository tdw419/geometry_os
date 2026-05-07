; Synthetic GeOS Program
; initialization
LDI r0, 146
LDI r24, 480
LDI r22, 605
LDI r4, 838
LDI r27, 0x00FF00
; main loop
loop_0:
  LDI r16, 16711680
  FILL r16
PSET r0, r12, r0
RECTF r22, r13, r4, r18, r13
  CMP r1, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0