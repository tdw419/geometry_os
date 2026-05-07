; Synthetic GeOS Program
; initialization
LDI r29, 936
LDI r3, 0x0000FF
LDI r17, 755
; main loop
loop_0:
  LDI r14, 16711935
  FILL r14
PSET r11, r12, r29
CIRCLE r15, r20, r23, r18
CIRCLE r24, r20, r19, r20
  CMP r14, r12
  JZ r0, loop_0
  FRAME
  JMP loop_0