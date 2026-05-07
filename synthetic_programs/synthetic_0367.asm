; Synthetic GeOS Program
; initialization
LDI r15, 808
LDI r4, 9
LDI r19, 0xFF0000
LDI r13, 156
LDI r18, 137
; arithmetic section
LDI r19, 167
LDI r0, 201
LDI r27, 389
ADD r2, r7, r8
SUB r3, r7, r16
ADD r30, r1, r3
LDI r30, 0x000000
; main loop
loop_0:
  LDI r27, 16711680
  FILL r27
RECTF r6, r21, r0, r10, r22
  CMP r10, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0