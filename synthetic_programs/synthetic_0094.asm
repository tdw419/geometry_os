; Synthetic GeOS Program
; initialization
LDI r10, 925
LDI r28, 662
LDI r29, 288
LDI r1, 0xFFFF00
; main loop
loop_0:
  LDI r16, 16777215
  FILL r16
PSET r18, r28, r1
  CMP r20, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0