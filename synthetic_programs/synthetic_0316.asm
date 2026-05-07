; Synthetic GeOS Program
; initialization
LDI r16, 193
LDI r18, 326
LDI r11, 249
; arithmetic section
ADD r13, r4, r25
ADD r28, r12, r30
SUB r9, r5, r31
LDI r19, 0xFF00FF
ADD r0, r20, r24
ADD r22, r4, r21
ADD r5, r10, r7
; main loop
loop_0:
  LDI r15, 8947848
  FILL r15
PSET r29, r6, r18
RECTF r17, r23, r18, r30, r31
PSET r16, r9, r4
  CMP r2, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0