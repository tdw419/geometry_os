; Synthetic GeOS Program
; initialization
LDI r28, 230
LDI r4, 15
LDI r22, 0x0000FF
LDI r21, 0xFF00FF
LDI r11, 395
; arithmetic section
SUB r26, r12, r15
LDI r31, 839
SUB r7, r21, r1
SUB r11, r30, r26
SUB r28, r18, r22
LDI r3, 690
LDI r6, 454
; main loop
loop_0:
  LDI r30, 65535
  FILL r30
LINE r10, r9, r17, r12, r10
PSET r28, r16, r28
  CMP r29, r10
  JZ r0, loop_0
  FRAME
  JMP loop_0