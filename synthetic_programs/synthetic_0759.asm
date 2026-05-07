; Synthetic GeOS Program
; initialization
LDI r19, 463
LDI r29, 356
LDI r17, 162
; main loop
loop_0:
  LDI r19, 8947848
  FILL r19
RECTF r2, r0, r2, r31, r5
LINE r17, r18, r10, r15, r27
LINE r8, r30, r26, r5, r1
  CMP r22, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0