; Synthetic GeOS Program
; initialization
LDI r7, 408
LDI r30, 384
LDI r22, 0xFFFF00
LDI r18, 888
LDI r16, 187
; main loop
loop_0:
  LDI r6, 16776960
  FILL r6
CIRCLE r18, r4, r22, r28
  CMP r29, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0