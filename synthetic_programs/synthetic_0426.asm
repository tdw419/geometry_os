; Synthetic GeOS Program
; initialization
LDI r1, 0xFFFFFF
LDI r13, 559
LDI r0, 0x000000
; arithmetic section
LDI r17, 0x888888
SUB r24, r0, r16
LDI r31, 996
LDI r23, 223
LDI r6, 626
LDI r8, 424
; main loop
loop_0:
  LDI r10, 16711680
  FILL r10
RECTF r30, r1, r21, r29, r23
CIRCLE r3, r5, r12, r29
  CMP r10, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0