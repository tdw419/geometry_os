; Synthetic GeOS Program
; initialization
LDI r6, 3
LDI r12, 449
LDI r26, 924
; main loop
loop_0:
  LDI r13, 16776960
  FILL r13
LINE r12, r14, r4, r9, r2
LINE r23, r0, r2, r21, r14
RECTF r13, r18, r30, r8, r13
  CMP r0, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0