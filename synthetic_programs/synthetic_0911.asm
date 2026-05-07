; Synthetic GeOS Program
; initialization
LDI r23, 109
LDI r11, 398
LDI r27, 704
LDI r12, 607
; main loop
loop_0:
  LDI r15, 255
  FILL r15
PSET r27, r3, r18
  CMP r16, r10
  JZ r0, loop_0
  FRAME
  JMP loop_0