; Synthetic GeOS Program
; initialization
LDI r15, 0x00FF00
LDI r15, 899
; arithmetic section
ADD r12, r7, r0
SUB r0, r1, r28
LDI r12, 266
ADD r6, r2, r0
ADD r15, r0, r31
ADD r22, r23, r28
; main loop
loop_0:
  LDI r18, 8947848
  FILL r18
CIRCLE r7, r19, r3, r23
  CMP r15, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0