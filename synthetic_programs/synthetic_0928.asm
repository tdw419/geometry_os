; Synthetic GeOS Program
; initialization
LDI r9, 1008
LDI r4, 217
LDI r26, 0xFFFF00
LDI r3, 0x00FFFF
; main loop
loop_0:
  LDI r27, 16777215
  FILL r27
LINE r5, r28, r31, r31, r19
PSET r3, r24, r24
LINE r30, r25, r20, r27, r19
  FRAME
  JMP loop_0