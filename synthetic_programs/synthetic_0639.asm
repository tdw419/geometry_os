; Synthetic GeOS Program
; initialization
LDI r17, 242
LDI r23, 217
LDI r10, 198
LDI r13, 499
LDI r28, 706
LDI r4, 0xFFFF00
; main loop
loop_0:
  LDI r16, 16776960
  FILL r16
PSET r26, r24, r13
CIRCLE r21, r12, r30, r15
  FRAME
  JMP loop_0