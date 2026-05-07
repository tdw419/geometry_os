; Synthetic GeOS Program
; initialization
LDI r10, 5
LDI r29, 287
LDI r29, 0x888888
LDI r21, 0x00FF00
LDI r10, 5
LDI r17, 0x00FFFF
; main loop
loop_0:
  LDI r25, 16711935
  FILL r25
CIRCLE r16, r2, r12, r4
LINE r15, r10, r15, r8, r8
  CMP r1, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0