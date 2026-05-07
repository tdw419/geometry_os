; Synthetic GeOS Program
; initialization
LDI r6, 961
LDI r15, 197
; arithmetic section
SUB r2, r25, r10
ADD r8, r16, r7
LDI r2, 0xFFFFFF
SUB r22, r6, r21
; main loop
loop_0:
  LDI r7, 16777215
  FILL r7
PSET r19, r24, r20
  CMP r28, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0