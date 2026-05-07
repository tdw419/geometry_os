; Synthetic GeOS Program
; initialization
LDI r13, 170
LDI r9, 212
; main loop
loop_0:
  LDI r14, 16777215
  FILL r14
PSET r17, r30, r16
  FRAME
  JMP loop_0