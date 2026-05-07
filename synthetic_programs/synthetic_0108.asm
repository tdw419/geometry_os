; Synthetic GeOS Program
; initialization
LDI r22, 636
LDI r4, 187
LDI r13, 355
LDI r26, 394
LDI r12, 114
LDI r29, 368
; arithmetic section
SUB r4, r4, r15
LDI r29, 448
ADD r14, r23, r14
ADD r11, r19, r16
LDI r18, 841
; main loop
loop_0:
  LDI r23, 65535
  FILL r23
PSET r28, r31, r3
  CMP r16, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0