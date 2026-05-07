; Synthetic GeOS Program
; initialization
LDI r26, 19
LDI r5, 906
LDI r14, 61
; main loop
loop_0:
  LDI r21, 65535
  FILL r21
PSET r24, r12, r14
LINE r31, r11, r26, r30, r24
  CMP r20, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0