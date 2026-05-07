; Synthetic GeOS Program
; initialization
LDI r15, 0xFFFF00
LDI r8, 1009
; main loop
loop_0:
  LDI r1, 255
  FILL r1
RECTF r6, r12, r6, r27, r0
  CMP r25, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0