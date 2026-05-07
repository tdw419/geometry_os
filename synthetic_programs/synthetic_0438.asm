; Synthetic GeOS Program
; initialization
LDI r18, 0x0000FF
LDI r25, 0xFFFFFF
LDI r16, 0xFFFFFF
LDI r17, 559
; main loop
loop_0:
  LDI r18, 0
  FILL r18
PSET r26, r16, r2
RECTF r7, r10, r1, r5, r28
PSET r17, r25, r12
  CMP r3, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0