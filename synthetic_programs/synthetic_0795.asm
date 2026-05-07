; Synthetic GeOS Program
; initialization
LDI r31, 994
LDI r30, 92
; arithmetic section
SUB r13, r18, r27
LDI r3, 925
SUB r2, r7, r26
; main loop
loop_0:
  LDI r31, 16776960
  FILL r31
CIRCLE r16, r3, r28, r12
CIRCLE r24, r2, r11, r20
CIRCLE r27, r5, r3, r20
  CMP r11, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0