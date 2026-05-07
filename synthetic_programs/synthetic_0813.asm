; Synthetic GeOS Program
; initialization
LDI r2, 0x000000
LDI r29, 933
LDI r20, 0x000000
LDI r6, 0x00FFFF
LDI r13, 0xFF0000
; main loop
loop_0:
  LDI r5, 255
  FILL r5
RECTF r14, r31, r1, r28, r21
LINE r8, r15, r31, r31, r27
PSET r14, r16, r21
  FRAME
  JMP loop_0