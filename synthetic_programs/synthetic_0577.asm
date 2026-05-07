; Synthetic GeOS Program
; initialization
LDI r17, 740
LDI r0, 474
; arithmetic section
LDI r5, 0x00FF00
SUB r3, r24, r18
LDI r14, 500
LDI r8, 0x888888
SUB r27, r31, r18
LDI r29, 203
; main loop
loop_0:
  LDI r24, 255
  FILL r24
RECTF r26, r21, r18, r13, r19
LINE r1, r6, r30, r7, r13
CIRCLE r22, r15, r21, r1
  CMP r4, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0