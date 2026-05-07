; Synthetic GeOS Program
; initialization
LDI r11, 929
LDI r0, 685
LDI r26, 825
LDI r8, 993
LDI r8, 650
; arithmetic section
SUB r29, r6, r27
SUB r4, r26, r29
SUB r12, r27, r0
ADD r31, r20, r30
SUB r23, r17, r18
LDI r28, 528
ADD r8, r26, r20
; main loop
loop_0:
  LDI r27, 16776960
  FILL r27
PSET r2, r26, r30
RECTF r14, r8, r3, r11, r30
PSET r26, r23, r23
  CMP r18, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0