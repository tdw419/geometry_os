; Synthetic GeOS Program
; initialization
LDI r17, 336
LDI r18, 0x00FF00
; arithmetic section
ADD r10, r27, r1
ADD r16, r8, r3
LDI r15, 298
SUB r10, r29, r5
ADD r18, r19, r2
; main loop
loop_0:
  LDI r9, 16711680
  FILL r9
CIRCLE r11, r7, r4, r23
PSET r14, r31, r4
  FRAME
  JMP loop_0