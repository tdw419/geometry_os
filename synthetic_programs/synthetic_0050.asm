; Synthetic GeOS Program
; initialization
LDI r10, 0x0000FF
LDI r15, 447
LDI r18, 46
LDI r14, 438
LDI r27, 704
; main loop
loop_0:
  LDI r21, 65280
  FILL r21
PSET r1, r21, r30
CIRCLE r19, r3, r3, r25
RECTF r11, r15, r20, r29, r3
  CMP r27, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0