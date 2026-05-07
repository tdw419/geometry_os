; Synthetic GeOS Program
; initialization
LDI r12, 121
LDI r7, 817
LDI r11, 330
LDI r3, 326
; main loop
loop_0:
  LDI r14, 65280
  FILL r14
CIRCLE r28, r20, r4, r6
  FRAME
  JMP loop_0