; Synthetic GeOS Program
; initialization
LDI r24, 887
LDI r27, 667
; arithmetic section
ADD r18, r2, r19
LDI r11, 334
LDI r27, 1015
ADD r7, r4, r0
ADD r1, r21, r19
; main loop
loop_0:
  LDI r30, 16776960
  FILL r30
CIRCLE r13, r9, r8, r4
RECTF r14, r2, r17, r31, r16
  CMP r26, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0