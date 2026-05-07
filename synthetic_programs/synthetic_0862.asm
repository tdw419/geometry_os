; Synthetic GeOS Program
; initialization
LDI r23, 741
LDI r22, 479
LDI r18, 332
LDI r1, 842
; arithmetic section
SUB r16, r18, r27
LDI r14, 886
SUB r4, r10, r10
; main loop
loop_0:
  LDI r8, 0
  FILL r8
RECTF r22, r11, r20, r28, r14
LINE r3, r0, r15, r3, r21
RECTF r25, r20, r11, r31, r24
  CMP r27, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0