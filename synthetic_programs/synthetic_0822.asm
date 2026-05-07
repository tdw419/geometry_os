; Synthetic GeOS Program
; initialization
LDI r24, 0x000000
LDI r3, 0xFF00FF
; arithmetic section
ADD r21, r4, r16
ADD r23, r26, r23
SUB r26, r2, r13
ADD r27, r7, r10
LDI r0, 0xFFFF00
ADD r26, r29, r11
; main loop
loop_0:
  LDI r17, 16777215
  FILL r17
RECTF r7, r22, r19, r17, r19
  CMP r4, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0