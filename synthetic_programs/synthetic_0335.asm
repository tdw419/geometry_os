; Synthetic GeOS Program
; initialization
LDI r9, 755
LDI r18, 280
LDI r8, 96
; main loop
loop_0:
  LDI r14, 8947848
  FILL r14
PSET r4, r17, r1
RECTF r26, r11, r13, r10, r2
  CMP r28, r11
  JZ r0, loop_0
  FRAME
  JMP loop_0