; Synthetic GeOS Program
; initialization
LDI r8, 0x00FF00
LDI r9, 0xFF0000
LDI r22, 229
; arithmetic section
LDI r7, 335
SUB r2, r13, r20
SUB r0, r16, r5
SUB r24, r14, r13
SUB r22, r14, r19
ADD r8, r27, r3
LDI r6, 945
; main loop
loop_0:
  LDI r22, 8947848
  FILL r22
PSET r14, r26, r17
CIRCLE r9, r17, r2, r30
PSET r28, r12, r2
  CMP r18, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0