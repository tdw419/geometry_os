; Synthetic GeOS Program
; initialization
LDI r30, 935
LDI r16, 502
LDI r23, 0x00FFFF
; main loop
loop_0:
  LDI r12, 8947848
  FILL r12
CIRCLE r24, r31, r21, r5
RECTF r30, r18, r10, r30, r1
LINE r31, r6, r3, r24, r29
  FRAME
  JMP loop_0