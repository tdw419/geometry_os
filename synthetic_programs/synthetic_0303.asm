; Synthetic GeOS Program
; initialization
LDI r18, 626
LDI r12, 409
LDI r22, 226
LDI r20, 76
LDI r24, 414
; main loop
loop_0:
  LDI r13, 16776960
  FILL r13
PSET r6, r14, r30
  CMP r11, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0