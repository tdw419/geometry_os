; Synthetic GeOS Program
; initialization
LDI r2, 369
LDI r8, 0xFFFFFF
LDI r24, 305
; main loop
loop_0:
  LDI r1, 65535
  FILL r1
LINE r10, r29, r11, r16, r8
  CMP r24, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0