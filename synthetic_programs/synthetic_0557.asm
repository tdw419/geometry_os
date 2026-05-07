; Synthetic GeOS Program
; initialization
LDI r15, 0xFFFF00
LDI r10, 609
LDI r11, 942
LDI r6, 257
LDI r22, 993
; main loop
loop_0:
  LDI r26, 16711680
  FILL r26
PSET r12, r28, r20
  FRAME
  JMP loop_0