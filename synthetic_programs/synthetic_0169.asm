; Synthetic GeOS Program
; initialization
LDI r29, 581
LDI r8, 384
LDI r28, 0xFF00FF
LDI r20, 944
; main loop
loop_0:
  LDI r9, 255
  FILL r9
LINE r20, r19, r17, r12, r6
  FRAME
  JMP loop_0