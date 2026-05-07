; Synthetic GeOS Program
; initialization
LDI r14, 735
LDI r6, 704
LDI r28, 55
LDI r24, 0xFFFFFF
LDI r25, 31
; main loop
loop_0:
  LDI r7, 255
  FILL r7
PSET r21, r3, r3
  CMP r18, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0