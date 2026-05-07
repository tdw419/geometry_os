; Synthetic GeOS Program
; initialization
LDI r26, 531
LDI r1, 0x00FFFF
LDI r12, 265
LDI r0, 616
; main loop
loop_0:
  LDI r8, 65535
  FILL r8
LINE r3, r1, r8, r25, r12
  CMP r8, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0