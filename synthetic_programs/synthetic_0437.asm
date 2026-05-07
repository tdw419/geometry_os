; Synthetic GeOS Program
; initialization
LDI r29, 859
LDI r22, 689
; main loop
loop_0:
  LDI r10, 16777215
  FILL r10
LINE r6, r21, r24, r11, r18
  CMP r9, r28
  JZ r0, loop_0
  FRAME
  JMP loop_0