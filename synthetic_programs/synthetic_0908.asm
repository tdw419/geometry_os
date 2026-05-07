; Synthetic GeOS Program
; initialization
LDI r19, 14
LDI r14, 0xFFFFFF
LDI r1, 469
LDI r10, 841
; arithmetic section
SUB r26, r22, r22
LDI r9, 0x00FF00
LDI r21, 237
SUB r18, r13, r18
LDI r8, 99
; main loop
loop_0:
  LDI r3, 16776960
  FILL r3
CIRCLE r22, r27, r8, r31
PSET r13, r30, r11
  CMP r17, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0