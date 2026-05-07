; Synthetic GeOS Program
; initialization
LDI r8, 775
LDI r23, 0xFF0000
; arithmetic section
LDI r12, 373
ADD r18, r17, r0
LDI r23, 840
SUB r20, r27, r1
ADD r17, r27, r17
ADD r31, r9, r5
LDI r17, 50
; main loop
loop_0:
  LDI r2, 16777215
  FILL r2
RECTF r15, r13, r28, r22, r12
  CMP r6, r22
  JZ r0, loop_0
  FRAME
  JMP loop_0