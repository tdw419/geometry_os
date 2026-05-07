; Synthetic GeOS Program
; initialization
LDI r16, 65
LDI r12, 743
LDI r15, 551
LDI r7, 616
LDI r27, 875
LDI r20, 0x888888
; main loop
loop_0:
  LDI r9, 65535
  FILL r9
LINE r12, r5, r26, r3, r29
CIRCLE r30, r13, r1, r4
  CMP r24, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0