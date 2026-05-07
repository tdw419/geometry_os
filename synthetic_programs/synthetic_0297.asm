; Synthetic GeOS Program
; initialization
LDI r15, 591
LDI r14, 0xFF0000
LDI r0, 341
; main loop
loop_0:
  LDI r8, 16711680
  FILL r8
LINE r2, r28, r16, r31, r10
  CMP r13, r10
  JZ r0, loop_0
  FRAME
  JMP loop_0