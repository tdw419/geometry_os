; Synthetic GeOS Program
; initialization
LDI r24, 121
LDI r14, 588
LDI r13, 0x888888
; arithmetic section
ADD r31, r25, r1
SUB r25, r10, r11
ADD r27, r6, r4
SUB r5, r6, r5
SUB r3, r10, r8
LDI r18, 412
LDI r29, 0xFF0000
; main loop
loop_0:
  LDI r1, 255
  FILL r1
RECTF r4, r3, r27, r14, r8
LINE r20, r14, r9, r5, r31
CIRCLE r14, r6, r4, r2
  FRAME
  JMP loop_0