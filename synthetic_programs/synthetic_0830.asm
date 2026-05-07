; Synthetic GeOS Program
; initialization
LDI r27, 0xFFFFFF
LDI r24, 1004
; main loop
loop_0:
  LDI r0, 16711680
  FILL r0
LINE r30, r8, r6, r29, r10
LINE r7, r22, r18, r27, r24
RECTF r10, r7, r31, r6, r25
  FRAME
  JMP loop_0