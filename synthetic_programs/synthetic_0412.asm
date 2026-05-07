; Synthetic GeOS Program
; initialization
LDI r18, 508
LDI r20, 880
LDI r5, 0x0000FF
; arithmetic section
LDI r12, 0x000000
LDI r8, 669
SUB r17, r4, r10
LDI r31, 799
ADD r24, r21, r7
LDI r26, 0xFF00FF
LDI r12, 333
LDI r18, 630
; main loop
loop_0:
  LDI r3, 8947848
  FILL r3
CIRCLE r20, r11, r4, r21
  CMP r30, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0