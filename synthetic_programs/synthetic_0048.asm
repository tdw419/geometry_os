; Synthetic GeOS Program
; initialization
LDI r0, 582
LDI r9, 327
LDI r20, 223
LDI r31, 0x000000
; arithmetic section
ADD r18, r26, r14
ADD r19, r3, r12
ADD r14, r16, r29
ADD r11, r26, r24
; main loop
loop_0:
  LDI r30, 65535
  FILL r30
PSET r29, r27, r9
PSET r24, r27, r31
  FRAME
  JMP loop_0