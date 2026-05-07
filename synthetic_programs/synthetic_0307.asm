; Synthetic GeOS Program
; initialization
LDI r10, 751
LDI r30, 0x000000
LDI r26, 122
LDI r8, 530
; main loop
loop_0:
  LDI r23, 65535
  FILL r23
PSET r4, r31, r25
  FRAME
  JMP loop_0