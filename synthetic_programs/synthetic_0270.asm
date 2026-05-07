; Synthetic GeOS Program
; initialization
LDI r14, 140
LDI r31, 622
LDI r17, 0xFFFFFF
; main loop
loop_0:
  LDI r5, 65535
  FILL r5
LINE r7, r26, r11, r4, r10
CIRCLE r14, r4, r23, r11
  FRAME
  JMP loop_0