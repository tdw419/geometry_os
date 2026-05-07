; Synthetic GeOS Program
; initialization
LDI r22, 567
LDI r20, 29
LDI r16, 672
LDI r3, 98
; arithmetic section
LDI r7, 0x000000
SUB r6, r22, r6
LDI r0, 0x00FFFF
ADD r11, r28, r17
; main loop
loop_0:
  LDI r31, 0
  FILL r31
PSET r5, r2, r11
PSET r3, r27, r18
  FRAME
  JMP loop_0