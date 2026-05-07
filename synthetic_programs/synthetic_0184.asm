; Synthetic GeOS Program
; initialization
LDI r20, 524
LDI r0, 722
LDI r18, 570
; arithmetic section
LDI r30, 0xFFFFFF
LDI r7, 436
ADD r2, r15, r24
LDI r12, 0x000000
LDI r1, 0x00FF00
LDI r8, 260
ADD r1, r21, r9
; main loop
loop_0:
  LDI r7, 65280
  FILL r7
RECTF r22, r18, r23, r6, r31
CIRCLE r13, r23, r14, r2
  CMP r20, r21
  JZ r0, loop_0
  FRAME
  JMP loop_0