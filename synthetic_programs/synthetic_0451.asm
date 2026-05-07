; Synthetic GeOS Program
; initialization
LDI r6, 522
LDI r1, 897
LDI r22, 255
LDI r21, 658
LDI r3, 46
; arithmetic section
ADD r11, r13, r0
SUB r11, r8, r12
ADD r2, r27, r30
SUB r20, r5, r22
ADD r25, r16, r4
; main loop
loop_0:
  LDI r6, 16777215
  FILL r6
CIRCLE r4, r18, r13, r20
LINE r25, r16, r23, r5, r14
  CMP r29, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0