; Synthetic GeOS Program
; initialization
LDI r16, 481
LDI r17, 142
LDI r8, 683
LDI r3, 34
LDI r31, 159
LDI r20, 0xFFFFFF
; arithmetic section
SUB r31, r20, r22
LDI r23, 639
SUB r20, r20, r17
LDI r1, 667
ADD r6, r17, r12
; main loop
loop_0:
  LDI r11, 65280
  FILL r11
RECTF r11, r0, r2, r16, r0
CIRCLE r31, r26, r24, r24
CIRCLE r18, r2, r30, r19
  FRAME
  JMP loop_0