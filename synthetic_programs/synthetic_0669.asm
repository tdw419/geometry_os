; Synthetic GeOS Program
; initialization
LDI r0, 740
LDI r8, 597
LDI r18, 52
LDI r18, 0x00FF00
LDI r9, 762
; main loop
loop_0:
  LDI r31, 65535
  FILL r31
RECTF r28, r5, r22, r15, r1
  FRAME
  JMP loop_0