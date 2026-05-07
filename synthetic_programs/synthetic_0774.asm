; Synthetic GeOS Program
; initialization
LDI r13, 522
LDI r0, 786
LDI r26, 456
; arithmetic section
SUB r9, r3, r13
SUB r19, r21, r1
SUB r17, r27, r5
; main loop
loop_0:
  LDI r7, 0
  FILL r7
LINE r16, r14, r20, r25, r5
RECTF r1, r24, r9, r31, r11
RECTF r30, r16, r23, r16, r14
  CMP r4, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0