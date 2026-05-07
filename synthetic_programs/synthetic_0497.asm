; Synthetic GeOS Program
; initialization
LDI r2, 108
LDI r21, 0x888888
LDI r25, 438
LDI r28, 192
LDI r25, 871
LDI r9, 113
; main loop
loop_0:
  LDI r21, 65535
  FILL r21
RECTF r8, r4, r2, r28, r16
LINE r29, r7, r31, r20, r4
  CMP r22, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0