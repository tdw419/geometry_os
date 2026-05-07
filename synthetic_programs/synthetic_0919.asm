; Synthetic GeOS Program
; initialization
LDI r24, 513
LDI r7, 718
; arithmetic section
LDI r9, 459
ADD r4, r2, r1
SUB r0, r11, r0
ADD r5, r19, r13
SUB r22, r16, r7
; main loop
loop_0:
  LDI r3, 16777215
  FILL r3
CIRCLE r8, r26, r7, r25
RECTF r8, r10, r11, r0, r1
RECTF r14, r26, r27, r30, r9
  FRAME
  JMP loop_0