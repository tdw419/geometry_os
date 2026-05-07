; Synthetic GeOS Program
; initialization
LDI r4, 444
LDI r2, 0x000000
LDI r9, 947
LDI r28, 512
LDI r1, 873
LDI r21, 196
; main loop
loop_0:
  LDI r22, 16776960
  FILL r22
RECTF r12, r14, r8, r23, r5
RECTF r17, r24, r18, r21, r24
  FRAME
  JMP loop_0