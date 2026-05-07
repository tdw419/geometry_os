; Synthetic GeOS Program
; initialization
LDI r26, 250
LDI r21, 0x00FF00
LDI r22, 41
LDI r26, 736
LDI r22, 669
; main loop
loop_0:
  LDI r29, 16776960
  FILL r29
RECTF r9, r18, r13, r2, r10
LINE r10, r6, r7, r19, r1
  CMP r9, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0