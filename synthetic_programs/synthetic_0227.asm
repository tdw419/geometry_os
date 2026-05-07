; Synthetic GeOS Program
; initialization
LDI r21, 0xFFFF00
LDI r8, 265
LDI r24, 589
LDI r4, 276
; main loop
loop_0:
  LDI r3, 16776960
  FILL r3
CIRCLE r9, r17, r16, r6
  CMP r28, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0