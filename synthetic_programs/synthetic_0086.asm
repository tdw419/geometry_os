; Synthetic GeOS Program
; initialization
LDI r9, 0x888888
LDI r12, 87
; main loop
loop_0:
  LDI r10, 65535
  FILL r10
CIRCLE r16, r18, r6, r16
  CMP r6, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0