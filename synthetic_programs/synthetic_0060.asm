; Synthetic GeOS Program
; initialization
LDI r7, 254
LDI r20, 513
LDI r15, 37
; main loop
loop_0:
  LDI r18, 16711935
  FILL r18
PSET r1, r5, r29
  CMP r30, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0