; Synthetic GeOS Program
; initialization
LDI r27, 512
LDI r29, 1007
LDI r16, 0xFF0000
LDI r24, 0x888888
LDI r7, 441
; arithmetic section
ADD r20, r5, r0
LDI r9, 617
LDI r0, 599
LDI r6, 667
LDI r14, 0x0000FF
LDI r4, 125
SUB r31, r24, r18
SUB r14, r28, r24
; main loop
loop_0:
  LDI r26, 8947848
  FILL r26
CIRCLE r16, r9, r30, r17
  CMP r5, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0