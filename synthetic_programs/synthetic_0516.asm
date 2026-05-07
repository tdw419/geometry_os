; Synthetic GeOS Program
; initialization
LDI r29, 0x00FFFF
LDI r15, 561
LDI r25, 0
LDI r0, 0x888888
; main loop
loop_0:
  LDI r12, 16777215
  FILL r12
RECTF r8, r18, r31, r22, r22
LINE r25, r20, r30, r14, r30
PSET r22, r15, r3
  CMP r27, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0