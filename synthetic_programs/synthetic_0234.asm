; Synthetic GeOS Program
; initialization
LDI r10, 17
LDI r4, 54
; arithmetic section
LDI r28, 683
SUB r10, r1, r11
SUB r25, r27, r6
; main loop
loop_0:
  LDI r3, 65535
  FILL r3
RECTF r14, r13, r20, r5, r31
  FRAME
  JMP loop_0