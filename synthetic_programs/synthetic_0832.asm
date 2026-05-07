; Synthetic GeOS Program
; initialization
LDI r27, 0x00FF00
LDI r15, 0xFF00FF
LDI r25, 0xFF0000
LDI r10, 636
LDI r31, 385
LDI r6, 0x00FF00
; arithmetic section
ADD r20, r15, r13
ADD r3, r31, r18
ADD r27, r8, r26
ADD r3, r19, r16
ADD r6, r11, r26
LDI r15, 0xFF00FF
; main loop
loop_0:
  LDI r17, 16776960
  FILL r17
CIRCLE r21, r25, r27, r12
CIRCLE r26, r1, r20, r25
CIRCLE r15, r17, r6, r30
  FRAME
  JMP loop_0