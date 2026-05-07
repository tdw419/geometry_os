; Synthetic GeOS Program
; initialization
LDI r22, 0xFFFF00
LDI r23, 870
LDI r23, 0x0000FF
LDI r12, 433
LDI r12, 615
LDI r6, 291
; arithmetic section
LDI r10, 168
ADD r13, r22, r2
SUB r24, r18, r19
LDI r2, 660
SUB r15, r15, r27
SUB r30, r19, r7
ADD r31, r29, r4
ADD r16, r1, r3
; main loop
loop_0:
  LDI r18, 0
  FILL r18
LINE r12, r29, r2, r9, r8
RECTF r10, r28, r30, r21, r12
RECTF r25, r9, r17, r7, r0
  CMP r29, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0