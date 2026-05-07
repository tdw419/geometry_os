; Synthetic GeOS Program
; initialization
LDI r28, 0x888888
LDI r7, 0x000000
LDI r5, 112
; main loop
loop_0:
  LDI r29, 8947848
  FILL r29
RECTF r30, r4, r14, r5, r10
  CMP r17, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0