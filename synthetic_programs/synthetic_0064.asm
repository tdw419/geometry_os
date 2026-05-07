; Synthetic GeOS Program
; initialization
LDI r31, 0xFFFF00
LDI r16, 0x00FF00
LDI r31, 403
LDI r6, 412
LDI r19, 284
; main loop
loop_0:
  LDI r12, 8947848
  FILL r12
LINE r0, r26, r28, r7, r7
LINE r30, r9, r3, r18, r5
  FRAME
  JMP loop_0