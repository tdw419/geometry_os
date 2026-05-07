; Synthetic GeOS Program
; initialization
LDI r31, 471
LDI r8, 689
LDI r27, 0x0000FF
LDI r11, 578
LDI r25, 357
LDI r1, 11
; main loop
loop_0:
  LDI r16, 255
  FILL r16
RECTF r22, r10, r3, r12, r25
PSET r20, r29, r13
PSET r23, r10, r5
  CMP r17, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0