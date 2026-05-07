; Synthetic GeOS Program
; initialization
LDI r0, 540
LDI r8, 0x00FFFF
LDI r15, 937
LDI r26, 0xFFFF00
LDI r31, 352
LDI r5, 956
; arithmetic section
LDI r23, 0x00FFFF
ADD r16, r23, r15
SUB r3, r19, r14
SUB r19, r22, r23
ADD r17, r14, r18
LDI r26, 600
ADD r22, r31, r2
; main loop
loop_0:
  LDI r2, 65280
  FILL r2
PSET r8, r13, r15
LINE r14, r1, r2, r9, r31
  FRAME
  JMP loop_0