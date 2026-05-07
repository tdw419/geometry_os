; Synthetic GeOS Program
; initialization
LDI r1, 87
LDI r30, 377
LDI r14, 301
LDI r26, 578
; main loop
loop_0:
  LDI r18, 65535
  FILL r18
LINE r17, r25, r31, r8, r27
RECTF r29, r23, r13, r28, r17
  CMP r13, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0