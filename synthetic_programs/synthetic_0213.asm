; Synthetic GeOS Program
; initialization
LDI r6, 597
LDI r30, 0xFF0000
LDI r19, 431
LDI r28, 0x00FFFF
; main loop
loop_0:
  LDI r3, 65280
  FILL r3
RECTF r22, r18, r13, r12, r0
  CMP r13, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0