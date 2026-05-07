; Synthetic GeOS Program
; initialization
LDI r17, 450
LDI r20, 551
LDI r8, 351
LDI r18, 154
LDI r18, 170
LDI r20, 960
; main loop
loop_0:
  LDI r28, 16711680
  FILL r28
PSET r17, r8, r18
  CMP r10, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0