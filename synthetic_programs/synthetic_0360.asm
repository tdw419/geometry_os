; Synthetic GeOS Program
; initialization
LDI r10, 0xFFFF00
LDI r2, 973
LDI r2, 721
LDI r11, 584
; arithmetic section
ADD r15, r31, r5
SUB r2, r22, r7
SUB r26, r12, r26
ADD r21, r3, r21
LDI r18, 423
LDI r8, 969
SUB r7, r6, r13
; main loop
loop_0:
  LDI r4, 16777215
  FILL r4
PSET r19, r11, r26
CIRCLE r7, r2, r17, r17
RECTF r2, r20, r24, r20, r10
  FRAME
  JMP loop_0