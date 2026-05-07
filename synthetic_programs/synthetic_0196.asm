; Synthetic GeOS Program
; initialization
LDI r7, 0x0000FF
LDI r27, 120
LDI r1, 999
; arithmetic section
SUB r13, r30, r23
SUB r31, r30, r23
SUB r31, r0, r0
LDI r25, 0x00FFFF
; main loop
loop_0:
  LDI r3, 16776960
  FILL r3
LINE r25, r18, r7, r24, r2
  FRAME
  JMP loop_0