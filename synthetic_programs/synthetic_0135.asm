; Synthetic GeOS Program
; initialization
LDI r21, 516
LDI r31, 911
LDI r26, 0xFF0000
; arithmetic section
ADD r26, r15, r9
SUB r14, r16, r22
LDI r21, 0xFFFFFF
SUB r22, r24, r8
LDI r15, 679
ADD r24, r2, r30
LDI r14, 757
; main loop
loop_0:
  LDI r23, 0
  FILL r23
LINE r18, r31, r16, r29, r8
PSET r28, r2, r11
  FRAME
  JMP loop_0