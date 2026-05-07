; Synthetic GeOS Program
; initialization
LDI r29, 693
LDI r8, 0xFFFF00
LDI r9, 706
; arithmetic section
ADD r20, r10, r6
ADD r28, r17, r18
SUB r16, r31, r7
; main loop
loop_0:
  LDI r4, 255
  FILL r4
PSET r22, r11, r24
  CMP r25, r24
  JZ r0, loop_0
  FRAME
  JMP loop_0