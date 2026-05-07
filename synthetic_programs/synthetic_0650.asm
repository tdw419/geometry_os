; Synthetic GeOS Program
; initialization
LDI r21, 81
LDI r28, 0x000000
; arithmetic section
ADD r18, r25, r4
LDI r26, 507
SUB r27, r28, r11
ADD r13, r11, r12
ADD r2, r9, r6
LDI r16, 56
SUB r16, r31, r29
; main loop
loop_0:
  LDI r26, 16777215
  FILL r26
RECTF r8, r21, r23, r27, r0
CIRCLE r8, r0, r19, r16
CIRCLE r20, r16, r28, r16
  FRAME
  JMP loop_0