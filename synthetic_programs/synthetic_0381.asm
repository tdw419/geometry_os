; Synthetic GeOS Program
; initialization
LDI r30, 957
LDI r14, 899
LDI r20, 991
LDI r15, 0x00FF00
LDI r13, 0xFF00FF
; main loop
loop_0:
  LDI r3, 0
  FILL r3
CIRCLE r15, r25, r21, r21
  CMP r30, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0