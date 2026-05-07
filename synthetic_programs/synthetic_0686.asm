; Synthetic GeOS Program
; initialization
LDI r11, 80
LDI r2, 238
LDI r6, 956
; arithmetic section
SUB r15, r4, r4
ADD r21, r5, r21
SUB r8, r6, r20
LDI r11, 477
LDI r15, 172
LDI r30, 882
ADD r2, r1, r3
; main loop
loop_0:
  LDI r24, 65280
  FILL r24
PSET r28, r9, r17
PSET r22, r14, r8
CIRCLE r8, r9, r5, r3
  CMP r10, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0