; Synthetic GeOS Program
; initialization
LDI r24, 285
LDI r7, 0xFF0000
; main loop
loop_0:
  LDI r29, 255
  FILL r29
PSET r0, r5, r28
LINE r17, r31, r18, r1, r29
  CMP r15, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0