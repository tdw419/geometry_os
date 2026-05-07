; Synthetic GeOS Program
; initialization
LDI r18, 0x00FF00
LDI r28, 0x888888
LDI r0, 77
LDI r7, 13
; arithmetic section
ADD r13, r26, r7
LDI r7, 935
SUB r21, r5, r25
SUB r4, r25, r10
LDI r3, 87
LDI r19, 134
LDI r30, 858
; main loop
loop_0:
  LDI r24, 255
  FILL r24
PSET r4, r14, r4
  CMP r28, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0