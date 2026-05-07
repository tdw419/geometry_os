; Synthetic GeOS Program
; initialization
LDI r0, 144
LDI r9, 17
; arithmetic section
SUB r26, r17, r19
ADD r1, r14, r26
ADD r19, r9, r22
; main loop
loop_0:
  LDI r8, 16776960
  FILL r8
LINE r14, r6, r17, r21, r28
  FRAME
  JMP loop_0