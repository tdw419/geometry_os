; Synthetic GeOS Program
; initialization
LDI r0, 75
LDI r22, 403
LDI r13, 463
LDI r24, 248
LDI r9, 779
LDI r26, 0x00FF00
; arithmetic section
ADD r27, r21, r17
LDI r14, 825
SUB r12, r1, r0
SUB r3, r11, r4
SUB r19, r28, r3
LDI r12, 472
ADD r16, r1, r10
LDI r12, 0xFFFFFF
; main loop
loop_0:
  LDI r10, 0
  FILL r10
LINE r16, r27, r20, r9, r14
CIRCLE r24, r5, r20, r6
RECTF r22, r14, r30, r6, r12
  CMP r16, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0