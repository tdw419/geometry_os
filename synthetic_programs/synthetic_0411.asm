; Synthetic GeOS Program
; initialization
LDI r15, 718
LDI r14, 488
LDI r10, 829
; main loop
loop_0:
  LDI r17, 255
  FILL r17
LINE r31, r29, r11, r21, r28
  CMP r6, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0