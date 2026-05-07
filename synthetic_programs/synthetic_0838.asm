; Synthetic GeOS Program
; initialization
LDI r27, 0x000000
LDI r24, 386
; main loop
loop_0:
  LDI r20, 255
  FILL r20
PSET r2, r24, r7
  FRAME
  JMP loop_0