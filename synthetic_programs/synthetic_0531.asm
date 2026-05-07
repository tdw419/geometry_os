; Synthetic GeOS Program
; initialization
LDI r3, 0xFF0000
LDI r5, 134
LDI r16, 205
; main loop
loop_0:
  LDI r5, 8947848
  FILL r5
CIRCLE r21, r20, r28, r27
CIRCLE r26, r15, r30, r27
LINE r7, r7, r11, r14, r24
  CMP r16, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0