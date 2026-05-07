; Synthetic GeOS Program
; initialization
LDI r18, 466
LDI r16, 75
LDI r1, 974
LDI r4, 0xFFFF00
LDI r9, 0x888888
LDI r17, 18
; main loop
loop_0:
  LDI r30, 65280
  FILL r30
PSET r6, r3, r0
LINE r26, r31, r25, r31, r26
  CMP r10, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0