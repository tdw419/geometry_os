; Synthetic GeOS Program
; initialization
LDI r19, 439
LDI r7, 50
LDI r17, 219
LDI r15, 709
LDI r21, 327
; arithmetic section
LDI r25, 925
LDI r17, 407
ADD r24, r17, r25
ADD r16, r13, r6
ADD r30, r18, r31
LDI r24, 578
ADD r3, r21, r19
LDI r5, 156
; main loop
loop_0:
  LDI r13, 255
  FILL r13
LINE r17, r11, r0, r8, r28
  CMP r23, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0