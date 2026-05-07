; Synthetic GeOS Program
; initialization
LDI r7, 677
LDI r7, 739
LDI r18, 139
LDI r20, 0xFFFF00
LDI r4, 26
LDI r10, 524
; main loop
loop_0:
  LDI r0, 16711935
  FILL r0
LINE r13, r13, r24, r1, r21
RECTF r30, r0, r15, r23, r26
  CMP r26, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0