; Synthetic GeOS Program
; initialization
LDI r1, 309
LDI r8, 0xFF0000
LDI r19, 466
LDI r17, 0x0000FF
LDI r31, 629
LDI r2, 111
; main loop
loop_0:
  LDI r31, 65535
  FILL r31
CIRCLE r21, r13, r17, r12
RECTF r6, r9, r22, r3, r21
  CMP r11, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0