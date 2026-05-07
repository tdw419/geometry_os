; Synthetic GeOS Program
; initialization
LDI r8, 858
LDI r29, 487
; main loop
loop_0:
  LDI r24, 255
  FILL r24
LINE r14, r19, r29, r5, r5
  CMP r2, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0