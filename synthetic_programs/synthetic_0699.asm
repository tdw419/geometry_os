; Synthetic GeOS Program
; initialization
LDI r15, 0x000000
LDI r28, 333
LDI r31, 256
LDI r23, 140
LDI r28, 833
LDI r30, 448
; arithmetic section
ADD r15, r22, r11
ADD r1, r22, r3
LDI r27, 294
; main loop
loop_0:
  LDI r3, 65535
  FILL r3
PSET r24, r6, r18
CIRCLE r5, r24, r28, r14
PSET r28, r9, r19
  CMP r17, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0