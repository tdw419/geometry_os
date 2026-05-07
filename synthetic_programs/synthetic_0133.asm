; Synthetic GeOS Program
; initialization
LDI r0, 0x000000
LDI r0, 1014
LDI r20, 158
LDI r6, 1010
LDI r1, 55
LDI r29, 758
; main loop
loop_0:
  LDI r3, 255
  FILL r3
PSET r15, r22, r3
CIRCLE r11, r4, r9, r19
RECTF r10, r16, r29, r30, r21
  CMP r7, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0