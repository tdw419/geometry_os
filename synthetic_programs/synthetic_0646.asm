; Synthetic GeOS Program
; initialization
LDI r5, 860
LDI r16, 849
LDI r31, 0xFF00FF
LDI r22, 352
LDI r26, 654
; arithmetic section
SUB r7, r5, r28
LDI r1, 282
LDI r10, 892
LDI r27, 220
LDI r17, 0x000000
SUB r11, r10, r9
; main loop
loop_0:
  LDI r4, 16777215
  FILL r4
CIRCLE r9, r13, r31, r21
LINE r20, r29, r17, r22, r27
  CMP r6, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0