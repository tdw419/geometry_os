; Synthetic GeOS Program
; initialization
LDI r28, 285
LDI r21, 398
LDI r13, 793
LDI r19, 445
LDI r11, 243
LDI r2, 848
; arithmetic section
SUB r12, r21, r29
SUB r4, r26, r7
LDI r3, 954
SUB r17, r1, r26
SUB r30, r12, r17
LDI r9, 638
SUB r23, r15, r1
SUB r25, r7, r0
; main loop
loop_0:
  LDI r26, 16776960
  FILL r26
PSET r31, r9, r28
  FRAME
  JMP loop_0