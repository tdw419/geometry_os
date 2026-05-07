; Synthetic GeOS Program
; initialization
LDI r29, 249
LDI r6, 542
LDI r15, 467
LDI r26, 240
LDI r5, 746
LDI r3, 0x00FFFF
; main loop
loop_0:
  LDI r25, 16776960
  FILL r25
RECTF r12, r27, r9, r21, r0
RECTF r23, r14, r29, r11, r26
  FRAME
  JMP loop_0