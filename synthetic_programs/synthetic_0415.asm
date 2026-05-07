; Synthetic GeOS Program
; initialization
LDI r19, 0xFFFF00
LDI r27, 519
LDI r12, 0x0000FF
LDI r31, 682
LDI r5, 218
LDI r13, 188
; arithmetic section
ADD r26, r13, r17
LDI r25, 542
ADD r9, r16, r27
; main loop
loop_0:
  LDI r20, 8947848
  FILL r20
PSET r11, r1, r5
  CMP r30, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0