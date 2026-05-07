; Synthetic GeOS Program
; initialization
LDI r14, 210
LDI r20, 280
LDI r14, 0x000000
LDI r2, 37
LDI r19, 195
; main loop
loop_0:
  LDI r1, 65280
  FILL r1
PSET r16, r26, r2
  CMP r17, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0