; Synthetic GeOS Program
; initialization
LDI r25, 684
LDI r22, 954
LDI r16, 0x00FFFF
LDI r23, 654
LDI r10, 15
; main loop
loop_0:
  LDI r29, 16776960
  FILL r29
PSET r15, r20, r22
  CMP r14, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0