; Synthetic GeOS Program
; initialization
LDI r17, 0xFFFFFF
LDI r24, 341
; arithmetic section
ADD r29, r26, r26
SUB r30, r31, r6
SUB r14, r15, r21
SUB r4, r11, r28
LDI r2, 648
LDI r6, 908
LDI r13, 19
LDI r31, 375
; main loop
loop_0:
  LDI r30, 255
  FILL r30
PSET r27, r22, r23
CIRCLE r29, r31, r3, r8
  FRAME
  JMP loop_0