; Synthetic GeOS Program
; initialization
LDI r28, 455
LDI r29, 326
LDI r13, 715
; arithmetic section
SUB r30, r31, r18
ADD r5, r25, r29
LDI r9, 172
SUB r6, r14, r26
LDI r13, 238
ADD r28, r28, r25
LDI r24, 1019
LDI r23, 0x000000
; main loop
loop_0:
  LDI r21, 255
  FILL r21
CIRCLE r7, r19, r1, r9
PSET r28, r17, r14
RECTF r16, r6, r5, r14, r23
  CMP r13, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0