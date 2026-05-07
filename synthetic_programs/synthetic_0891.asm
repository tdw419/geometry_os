; Synthetic GeOS Program
; initialization
LDI r9, 658
LDI r16, 0xFF0000
LDI r0, 178
; main loop
loop_0:
  LDI r5, 65535
  FILL r5
RECTF r12, r8, r9, r31, r26
  FRAME
  JMP loop_0