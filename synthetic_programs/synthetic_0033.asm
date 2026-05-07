; Synthetic GeOS Program
; initialization
LDI r4, 920
LDI r21, 32
LDI r4, 0xFFFFFF
LDI r2, 0xFF0000
LDI r14, 607
LDI r25, 158
; arithmetic section
ADD r0, r30, r9
SUB r11, r26, r21
LDI r3, 960
LDI r10, 992
SUB r16, r28, r7
ADD r22, r11, r21
LDI r20, 227
ADD r6, r29, r17
; main loop
loop_0:
  LDI r5, 255
  FILL r5
PSET r30, r17, r20
CIRCLE r11, r14, r1, r9
  CMP r18, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0