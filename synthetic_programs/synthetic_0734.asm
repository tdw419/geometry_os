; Synthetic GeOS Program
; initialization
LDI r19, 785
LDI r1, 0xFFFFFF
LDI r22, 844
LDI r9, 0xFFFF00
; main loop
loop_0:
  LDI r12, 65535
  FILL r12
LINE r11, r18, r21, r13, r14
PSET r22, r18, r29
  CMP r16, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0