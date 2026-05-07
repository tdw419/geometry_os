; Synthetic GeOS Program
; initialization
LDI r2, 790
LDI r3, 542
LDI r28, 0xFFFFFF
; arithmetic section
SUB r6, r9, r11
ADD r9, r26, r27
SUB r14, r16, r29
LDI r9, 0x00FF00
ADD r18, r25, r7
; main loop
loop_0:
  LDI r18, 65535
  FILL r18
LINE r26, r9, r11, r16, r29
LINE r14, r18, r24, r0, r12
CIRCLE r0, r9, r23, r31
  FRAME
  JMP loop_0