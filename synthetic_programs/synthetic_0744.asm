; Synthetic GeOS Program
; initialization
LDI r9, 182
LDI r19, 119
; arithmetic section
ADD r25, r20, r24
SUB r13, r2, r15
LDI r0, 0x000000
LDI r12, 0x00FF00
ADD r24, r9, r17
ADD r21, r10, r31
SUB r10, r5, r3
; main loop
loop_0:
  LDI r14, 255
  FILL r14
LINE r6, r15, r4, r4, r30
RECTF r31, r7, r26, r8, r0
  CMP r15, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0