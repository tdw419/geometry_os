; Synthetic GeOS Program
; initialization
LDI r30, 580
LDI r13, 0x888888
LDI r18, 535
LDI r7, 0xFF00FF
LDI r23, 478
; arithmetic section
SUB r19, r2, r19
ADD r31, r14, r26
ADD r11, r27, r20
ADD r17, r11, r20
; main loop
loop_0:
  LDI r29, 65280
  FILL r29
LINE r20, r25, r13, r26, r22
LINE r5, r14, r13, r10, r21
CIRCLE r19, r4, r3, r10
  CMP r27, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0