; Synthetic GeOS Program
; initialization
LDI r15, 0xFFFFFF
LDI r22, 265
LDI r31, 186
LDI r9, 0x000000
LDI r23, 510
LDI r27, 1002
; arithmetic section
ADD r2, r30, r11
ADD r28, r27, r28
SUB r17, r17, r30
LDI r24, 0x000000
ADD r5, r27, r4
SUB r22, r2, r4
ADD r30, r26, r20
; main loop
loop_0:
  LDI r10, 16711680
  FILL r10
RECTF r26, r18, r15, r3, r29
RECTF r15, r13, r25, r26, r17
  FRAME
  JMP loop_0