; Synthetic GeOS Program
; initialization
LDI r12, 0xFF0000
LDI r15, 229
LDI r13, 171
LDI r15, 83
; main loop
loop_0:
  LDI r26, 8947848
  FILL r26
LINE r18, r16, r4, r27, r14
  FRAME
  JMP loop_0