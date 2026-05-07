; Synthetic GeOS Program
; initialization
LDI r15, 0x00FF00
LDI r27, 421
LDI r3, 437
; arithmetic section
LDI r26, 729
LDI r8, 0xFFFFFF
LDI r13, 214
LDI r8, 0x888888
ADD r15, r0, r22
; main loop
loop_0:
  LDI r13, 16776960
  FILL r13
RECTF r13, r17, r12, r8, r30
  FRAME
  JMP loop_0