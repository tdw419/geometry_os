; Synthetic GeOS Program
; initialization
LDI r2, 0x000000
LDI r6, 771
; main loop
loop_0:
  LDI r25, 16776960
  FILL r25
CIRCLE r8, r26, r28, r3
CIRCLE r16, r27, r20, r5
  CMP r4, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0