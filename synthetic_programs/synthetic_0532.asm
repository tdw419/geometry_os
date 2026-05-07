; Synthetic GeOS Program
; initialization
LDI r7, 607
LDI r13, 408
LDI r28, 0x00FF00
LDI r2, 200
LDI r22, 402
LDI r21, 0xFFFFFF
; arithmetic section
SUB r1, r15, r13
ADD r29, r22, r0
SUB r2, r19, r20
; main loop
loop_0:
  LDI r5, 8947848
  FILL r5
LINE r1, r18, r9, r12, r15
LINE r12, r11, r5, r16, r14
LINE r23, r2, r0, r1, r31
  CMP r5, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0