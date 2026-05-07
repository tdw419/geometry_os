; Synthetic GeOS Program
; initialization
LDI r3, 217
LDI r1, 598
LDI r7, 0x0000FF
LDI r30, 0xFF00FF
LDI r4, 0x00FF00
LDI r15, 512
; main loop
loop_0:
  LDI r20, 16777215
  FILL r20
CIRCLE r4, r9, r9, r10
RECTF r7, r4, r7, r15, r6
CIRCLE r29, r1, r7, r15
  CMP r12, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0