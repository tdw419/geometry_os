; Synthetic GeOS Program
; initialization
LDI r7, 575
LDI r5, 351
LDI r29, 20
LDI r9, 522
LDI r27, 984
; arithmetic section
LDI r6, 808
LDI r30, 554
SUB r12, r24, r22
SUB r3, r11, r4
SUB r22, r14, r6
SUB r6, r8, r6
LDI r24, 0xFFFFFF
ADD r7, r24, r19
; main loop
loop_0:
  LDI r7, 16711680
  FILL r7
RECTF r7, r9, r25, r21, r15
  CMP r30, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0