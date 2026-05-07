; Synthetic GeOS Program
; initialization
LDI r7, 994
LDI r16, 89
LDI r27, 0xFFFFFF
; arithmetic section
LDI r15, 222
SUB r24, r12, r6
SUB r27, r4, r1
; main loop
loop_0:
  LDI r12, 65535
  FILL r12
RECTF r2, r25, r1, r1, r16
LINE r22, r10, r11, r24, r13
LINE r22, r3, r0, r12, r27
  FRAME
  JMP loop_0