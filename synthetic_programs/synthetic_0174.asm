; Synthetic GeOS Program
; initialization
LDI r24, 128
LDI r30, 142
LDI r31, 922
LDI r25, 0x00FFFF
LDI r28, 506
; main loop
loop_0:
  LDI r14, 16777215
  FILL r14
LINE r22, r20, r13, r26, r27
  FRAME
  JMP loop_0