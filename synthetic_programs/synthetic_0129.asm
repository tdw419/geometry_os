; Synthetic GeOS Program
; initialization
LDI r11, 299
LDI r10, 0x888888
LDI r9, 170
LDI r21, 377
; main loop
loop_0:
  LDI r31, 65280
  FILL r31
PSET r8, r5, r13
  CMP r14, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0