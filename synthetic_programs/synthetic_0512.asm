; Synthetic GeOS Program
; initialization
LDI r15, 658
LDI r24, 0x000000
LDI r16, 154
LDI r1, 611
LDI r6, 939
LDI r9, 873
; main loop
loop_0:
  LDI r30, 16711680
  FILL r30
RECTF r9, r4, r9, r15, r10
  FRAME
  JMP loop_0