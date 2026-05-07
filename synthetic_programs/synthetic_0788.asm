; Synthetic GeOS Program
; initialization
LDI r28, 925
LDI r17, 202
LDI r14, 986
; arithmetic section
SUB r21, r2, r27
SUB r18, r1, r29
SUB r26, r26, r24
SUB r11, r16, r14
SUB r0, r12, r10
SUB r14, r6, r10
; main loop
loop_0:
  LDI r26, 16711935
  FILL r26
CIRCLE r14, r28, r23, r5
  CMP r26, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0