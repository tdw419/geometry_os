; Synthetic GeOS Program
; initialization
LDI r2, 0x888888
LDI r16, 939
LDI r9, 935
LDI r17, 0x00FF00
LDI r12, 991
LDI r0, 440
; arithmetic section
SUB r27, r3, r5
LDI r17, 864
ADD r29, r20, r20
SUB r23, r26, r3
LDI r0, 0x00FFFF
; main loop
loop_0:
  LDI r3, 16711935
  FILL r3
CIRCLE r13, r12, r2, r19
RECTF r24, r22, r6, r31, r26
  FRAME
  JMP loop_0