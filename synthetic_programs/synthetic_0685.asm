; Synthetic GeOS Program
; initialization
LDI r9, 841
LDI r11, 866
LDI r28, 564
LDI r10, 864
LDI r14, 332
; main loop
loop_0:
  LDI r18, 16777215
  FILL r18
RECTF r25, r7, r7, r20, r5
  FRAME
  JMP loop_0