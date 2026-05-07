; Synthetic GeOS Program
; initialization
LDI r22, 307
LDI r22, 610
LDI r11, 82
LDI r21, 211
; main loop
loop_0:
  LDI r26, 0
  FILL r26
CIRCLE r0, r3, r29, r5
LINE r15, r30, r11, r11, r8
CIRCLE r12, r27, r19, r1
  FRAME
  JMP loop_0