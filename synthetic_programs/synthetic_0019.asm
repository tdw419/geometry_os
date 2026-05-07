; Synthetic GeOS Program
; initialization
LDI r30, 0xFFFF00
LDI r19, 948
LDI r15, 605
; arithmetic section
ADD r6, r24, r23
LDI r31, 694
LDI r0, 612
ADD r5, r2, r14
SUB r10, r11, r28
ADD r5, r28, r24
ADD r13, r10, r9
; main loop
loop_0:
  LDI r2, 65280
  FILL r2
PSET r8, r1, r11
  CMP r10, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0