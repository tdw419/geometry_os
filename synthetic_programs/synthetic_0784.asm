; Synthetic GeOS Program
; initialization
LDI r28, 0x00FF00
LDI r2, 1015
; arithmetic section
LDI r28, 582
LDI r15, 960
LDI r20, 999
LDI r4, 485
ADD r12, r5, r14
; main loop
loop_0:
  LDI r23, 16711680
  FILL r23
CIRCLE r26, r17, r8, r11
  CMP r0, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0