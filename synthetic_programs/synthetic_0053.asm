; Synthetic GeOS Program
; initialization
LDI r3, 293
LDI r30, 347
LDI r27, 37
LDI r23, 146
; main loop
loop_0:
  LDI r22, 16776960
  FILL r22
LINE r31, r30, r8, r14, r28
PSET r22, r20, r11
PSET r10, r18, r15
  FRAME
  JMP loop_0