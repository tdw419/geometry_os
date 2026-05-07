; Synthetic GeOS Program
; initialization
LDI r17, 421
LDI r2, 0x00FFFF
LDI r24, 0x0000FF
LDI r31, 95
LDI r21, 0xFFFFFF
; main loop
loop_0:
  LDI r29, 65280
  FILL r29
PSET r31, r31, r21
PSET r26, r23, r10
  CMP r3, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0