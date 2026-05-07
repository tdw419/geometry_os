; Synthetic GeOS Program
; initialization
LDI r26, 366
LDI r26, 56
LDI r4, 472
LDI r8, 0x0000FF
; main loop
loop_0:
  LDI r2, 65280
  FILL r2
LINE r1, r30, r22, r16, r10
LINE r22, r12, r7, r29, r8
  CMP r15, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0