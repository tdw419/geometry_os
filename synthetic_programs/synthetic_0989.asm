; Synthetic GeOS Program
; initialization
LDI r3, 898
LDI r21, 0xFFFFFF
LDI r15, 0x00FF00
LDI r26, 810
LDI r11, 837
LDI r2, 669
; main loop
loop_0:
  LDI r20, 8947848
  FILL r20
LINE r11, r7, r19, r1, r0
LINE r6, r4, r30, r27, r21
CIRCLE r12, r18, r1, r15
  FRAME
  JMP loop_0