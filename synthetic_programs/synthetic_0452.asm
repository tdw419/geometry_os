; Synthetic GeOS Program
; initialization
LDI r27, 961
LDI r13, 0x000000
LDI r8, 714
LDI r10, 886
; arithmetic section
SUB r2, r14, r8
ADD r2, r24, r6
ADD r27, r26, r12
ADD r17, r3, r4
SUB r27, r25, r5
LDI r8, 676
; main loop
loop_0:
  LDI r20, 65280
  FILL r20
CIRCLE r15, r31, r7, r28
LINE r26, r3, r24, r24, r23
CIRCLE r27, r9, r10, r7
  CMP r12, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0