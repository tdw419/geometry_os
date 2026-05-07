; Synthetic GeOS Program
; initialization
LDI r12, 642
LDI r28, 413
LDI r5, 909
LDI r29, 1017
LDI r17, 461
; arithmetic section
LDI r20, 683
LDI r3, 0x888888
LDI r25, 61
LDI r8, 0xFF00FF
; main loop
loop_0:
  LDI r11, 255
  FILL r11
LINE r6, r2, r22, r10, r1
PSET r15, r30, r23
  CMP r1, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0