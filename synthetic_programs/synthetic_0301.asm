; Synthetic GeOS Program
; initialization
LDI r7, 0xFF0000
LDI r30, 545
LDI r30, 0x00FFFF
LDI r5, 573
LDI r20, 879
LDI r20, 2
; arithmetic section
ADD r13, r17, r22
SUB r7, r27, r12
SUB r19, r2, r4
LDI r25, 143
ADD r15, r18, r23
SUB r5, r8, r9
LDI r23, 0x00FF00
; main loop
loop_0:
  LDI r5, 255
  FILL r5
CIRCLE r29, r14, r28, r28
PSET r19, r4, r24
  CMP r14, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0