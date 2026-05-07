; Synthetic GeOS Program
; initialization
LDI r14, 277
LDI r28, 645
LDI r22, 426
LDI r30, 1006
LDI r6, 0x000000
LDI r18, 992
; main loop
loop_0:
  LDI r2, 65280
  FILL r2
PSET r10, r1, r18
CIRCLE r20, r15, r15, r30
PSET r1, r11, r22
  FRAME
  JMP loop_0