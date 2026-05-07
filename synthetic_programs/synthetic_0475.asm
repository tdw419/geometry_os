; Synthetic GeOS Program
; initialization
LDI r11, 261
LDI r11, 740
; main loop
loop_0:
  LDI r9, 65280
  FILL r9
PSET r10, r20, r0
LINE r10, r4, r0, r31, r9
PSET r13, r21, r12
  CMP r6, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0