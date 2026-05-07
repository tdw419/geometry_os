; Synthetic GeOS Program
; initialization
LDI r22, 0x00FF00
LDI r22, 436
; arithmetic section
SUB r2, r2, r2
SUB r6, r8, r13
ADD r26, r29, r10
SUB r18, r9, r27
LDI r5, 792
ADD r14, r22, r0
SUB r1, r15, r24
SUB r21, r8, r1
; main loop
loop_0:
  LDI r7, 65535
  FILL r7
RECTF r17, r21, r6, r24, r18
  FRAME
  JMP loop_0