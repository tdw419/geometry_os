; Synthetic GeOS Program
; initialization
LDI r17, 147
LDI r31, 253
; main loop
loop_0:
  LDI r4, 65535
  FILL r4
PSET r24, r29, r3
LINE r1, r8, r28, r5, r1
  CMP r27, r9
  JZ r0, loop_0
  FRAME
  JMP loop_0