; Synthetic GeOS Program
; initialization
LDI r28, 0x00FF00
LDI r9, 976
LDI r5, 399
LDI r2, 346
LDI r7, 658
; arithmetic section
LDI r19, 487
ADD r19, r28, r9
LDI r16, 0x00FFFF
; main loop
loop_0:
  LDI r5, 65535
  FILL r5
LINE r24, r9, r3, r2, r26
RECTF r23, r27, r14, r27, r17
  FRAME
  JMP loop_0