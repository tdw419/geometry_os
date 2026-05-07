; Synthetic GeOS Program
; initialization
LDI r11, 844
LDI r10, 356
LDI r16, 985
LDI r29, 56
; arithmetic section
LDI r28, 98
LDI r15, 311
SUB r15, r14, r24
SUB r1, r23, r26
ADD r6, r10, r4
LDI r24, 206
; main loop
loop_0:
  LDI r0, 65535
  FILL r0
RECTF r14, r10, r10, r8, r3
RECTF r18, r7, r4, r28, r1
RECTF r13, r12, r2, r6, r30
  CMP r25, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0