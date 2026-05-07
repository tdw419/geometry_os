; Synthetic GeOS Program
; initialization
LDI r4, 900
LDI r9, 0x888888
; main loop
loop_0:
  LDI r15, 16711680
  FILL r15
CIRCLE r27, r2, r14, r10
  CMP r11, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0