; Synthetic GeOS Program
; initialization
LDI r30, 0x0000FF
LDI r4, 650
LDI r8, 615
LDI r4, 366
LDI r8, 1001
LDI r19, 730
; arithmetic section
ADD r22, r15, r15
SUB r30, r13, r14
SUB r24, r30, r26
ADD r15, r10, r31
; main loop
loop_0:
  LDI r16, 8947848
  FILL r16
PSET r20, r6, r1
RECTF r21, r1, r12, r20, r28
PSET r12, r30, r30
  FRAME
  JMP loop_0