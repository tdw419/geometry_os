; Synthetic GeOS Program
; initialization
LDI r22, 97
LDI r29, 662
LDI r0, 0xFF00FF
LDI r8, 242
; main loop
loop_0:
  LDI r15, 16711680
  FILL r15
CIRCLE r13, r14, r14, r13
  CMP r13, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0