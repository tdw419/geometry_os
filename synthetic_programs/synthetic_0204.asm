; Synthetic GeOS Program
; initialization
LDI r1, 679
LDI r30, 0xFF0000
LDI r5, 239
LDI r3, 0xFFFF00
; arithmetic section
ADD r7, r27, r29
LDI r6, 466
LDI r25, 736
LDI r23, 0xFF0000
SUB r7, r9, r18
; main loop
loop_0:
  LDI r12, 16776960
  FILL r12
CIRCLE r13, r16, r15, r31
RECTF r4, r17, r18, r7, r16
  FRAME
  JMP loop_0