; Synthetic GeOS Program
; initialization
LDI r15, 868
LDI r4, 278
LDI r5, 0xFFFFFF
LDI r23, 873
; arithmetic section
LDI r24, 425
ADD r9, r8, r15
ADD r9, r30, r7
SUB r23, r0, r14
SUB r11, r21, r8
SUB r28, r0, r23
; main loop
loop_0:
  LDI r3, 16777215
  FILL r3
PSET r23, r24, r27
RECTF r1, r5, r12, r16, r15
  FRAME
  JMP loop_0