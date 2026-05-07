; Synthetic GeOS Program
; initialization
LDI r10, 897
LDI r29, 128
LDI r16, 150
LDI r26, 928
LDI r16, 535
LDI r12, 201
; arithmetic section
ADD r7, r22, r12
SUB r9, r18, r1
LDI r23, 831
ADD r16, r2, r10
SUB r26, r4, r22
SUB r31, r10, r19
SUB r20, r3, r11
LDI r17, 344
; main loop
loop_0:
  LDI r5, 255
  FILL r5
RECTF r7, r27, r20, r23, r4
CIRCLE r19, r29, r5, r18
  FRAME
  JMP loop_0