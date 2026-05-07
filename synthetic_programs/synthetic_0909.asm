; Synthetic GeOS Program
; initialization
LDI r28, 0x00FF00
LDI r6, 327
LDI r7, 803
LDI r20, 982
; main loop
loop_0:
  LDI r14, 0
  FILL r14
RECTF r30, r31, r22, r4, r28
  FRAME
  JMP loop_0