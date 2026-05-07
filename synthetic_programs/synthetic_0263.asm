; Synthetic GeOS Program
; initialization
LDI r22, 284
LDI r4, 775
LDI r18, 567
LDI r23, 0x00FFFF
LDI r30, 0xFF0000
; main loop
loop_0:
  LDI r28, 16776960
  FILL r28
RECTF r12, r6, r9, r5, r26
  FRAME
  JMP loop_0