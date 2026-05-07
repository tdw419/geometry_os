; Synthetic GeOS Program
; initialization
LDI r22, 529
LDI r23, 0x00FFFF
LDI r6, 126
LDI r9, 660
LDI r13, 107
LDI r26, 586
; main loop
loop_0:
  LDI r27, 16711935
  FILL r27
PSET r10, r29, r5
LINE r8, r28, r2, r6, r21
  CMP r21, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0