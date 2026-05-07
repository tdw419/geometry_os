; Synthetic GeOS Program
; initialization
LDI r26, 56
LDI r1, 964
LDI r26, 0xFF0000
LDI r12, 586
LDI r10, 36
LDI r15, 0x00FF00
; arithmetic section
SUB r30, r27, r26
ADD r28, r31, r5
SUB r14, r17, r26
SUB r31, r19, r31
ADD r11, r13, r20
; main loop
loop_0:
  LDI r16, 65280
  FILL r16
RECTF r16, r26, r7, r6, r6
  FRAME
  JMP loop_0