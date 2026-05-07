; Synthetic GeOS Program
; initialization
LDI r1, 904
LDI r24, 669
LDI r22, 740
LDI r3, 522
; arithmetic section
LDI r17, 267
LDI r23, 897
LDI r22, 804
; main loop
loop_0:
  LDI r6, 255
  FILL r6
RECTF r24, r25, r16, r2, r23
  CMP r15, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0