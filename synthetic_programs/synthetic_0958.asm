; Synthetic GeOS Program
; initialization
LDI r19, 936
LDI r8, 302
; arithmetic section
ADD r20, r12, r20
LDI r9, 432
LDI r18, 145
SUB r7, r16, r30
SUB r30, r9, r15
SUB r30, r6, r8
; main loop
loop_0:
  LDI r11, 0
  FILL r11
PSET r11, r20, r29
LINE r4, r21, r7, r18, r17
  FRAME
  JMP loop_0