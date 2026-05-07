; Synthetic GeOS Program
; initialization
LDI r18, 869
LDI r29, 426
LDI r2, 202
LDI r5, 907
; arithmetic section
LDI r5, 0x888888
ADD r24, r5, r14
SUB r29, r18, r29
SUB r27, r6, r31
; main loop
loop_0:
  LDI r27, 255
  FILL r27
PSET r23, r2, r15
  CMP r11, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0