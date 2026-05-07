; Synthetic GeOS Program
; initialization
LDI r6, 0xFF0000
LDI r10, 143
LDI r6, 0x888888
LDI r23, 172
; main loop
loop_0:
  LDI r10, 16777215
  FILL r10
CIRCLE r12, r30, r15, r19
  CMP r0, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0