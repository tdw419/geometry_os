; Synthetic GeOS Program
; initialization
LDI r15, 750
LDI r9, 611
LDI r10, 0x00FF00
LDI r8, 987
LDI r10, 718
LDI r13, 981
; main loop
loop_0:
  LDI r10, 0
  FILL r10
LINE r12, r7, r0, r4, r17
  FRAME
  JMP loop_0