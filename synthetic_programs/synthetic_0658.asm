; Synthetic GeOS Program
; initialization
LDI r16, 980
LDI r24, 718
LDI r11, 1015
LDI r2, 949
; arithmetic section
SUB r14, r20, r7
SUB r10, r4, r1
SUB r0, r11, r25
LDI r22, 869
; main loop
loop_0:
  LDI r29, 16777215
  FILL r29
CIRCLE r25, r21, r6, r0
RECTF r27, r27, r5, r4, r28
LINE r18, r8, r15, r27, r25
  CMP r25, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0