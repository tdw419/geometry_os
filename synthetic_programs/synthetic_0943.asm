; Synthetic GeOS Program
; initialization
LDI r3, 772
LDI r15, 122
LDI r30, 967
LDI r24, 533
; arithmetic section
ADD r16, r29, r17
SUB r11, r10, r27
SUB r23, r25, r3
SUB r24, r15, r7
LDI r23, 0x00FFFF
; main loop
loop_0:
  LDI r23, 0
  FILL r23
CIRCLE r25, r12, r20, r20
PSET r4, r23, r1
CIRCLE r7, r19, r27, r25
  CMP r11, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0