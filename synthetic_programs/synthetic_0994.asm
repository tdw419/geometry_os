; Synthetic GeOS Program
; initialization
LDI r17, 623
LDI r23, 0xFFFF00
LDI r1, 111
; main loop
loop_0:
  LDI r5, 65535
  FILL r5
CIRCLE r28, r27, r16, r14
  CMP r18, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0