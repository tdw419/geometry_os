; Synthetic GeOS Program
; initialization
LDI r5, 0x888888
LDI r17, 253
LDI r5, 457
LDI r7, 711
LDI r2, 100
LDI r1, 816
; main loop
loop_0:
  LDI r10, 16776960
  FILL r10
CIRCLE r5, r17, r13, r30
CIRCLE r11, r20, r18, r15
CIRCLE r31, r16, r2, r9
  CMP r27, r15
  JZ r0, loop_0
  FRAME
  JMP loop_0