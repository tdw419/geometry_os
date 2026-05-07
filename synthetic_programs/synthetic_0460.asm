; Synthetic GeOS Program
; initialization
LDI r9, 0x00FF00
LDI r5, 405
; main loop
loop_0:
  LDI r26, 8947848
  FILL r26
LINE r19, r6, r21, r28, r29
LINE r1, r24, r20, r11, r13
  CMP r6, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0