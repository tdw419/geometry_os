; Synthetic GeOS Program
; initialization
LDI r2, 0x000000
LDI r8, 571
; arithmetic section
ADD r28, r25, r0
SUB r9, r5, r31
LDI r27, 496
LDI r18, 516
; main loop
loop_0:
  LDI r25, 0
  FILL r25
LINE r29, r12, r3, r18, r4
PSET r30, r21, r26
  CMP r11, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0