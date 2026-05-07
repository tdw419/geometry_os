; Synthetic GeOS Program
; initialization
LDI r18, 68
LDI r3, 126
LDI r12, 38
LDI r13, 0x00FFFF
LDI r17, 888
LDI r3, 1013
; main loop
loop_0:
  LDI r8, 16711680
  FILL r8
PSET r15, r11, r12
RECTF r9, r11, r29, r24, r25
  FRAME
  JMP loop_0