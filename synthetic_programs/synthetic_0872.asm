; Synthetic GeOS Program
; initialization
LDI r20, 582
LDI r9, 981
LDI r31, 497
; main loop
loop_0:
  LDI r16, 65535
  FILL r16
LINE r24, r25, r26, r27, r12
  FRAME
  JMP loop_0