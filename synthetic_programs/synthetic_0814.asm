; Synthetic GeOS Program
; initialization
LDI r1, 353
LDI r19, 334
LDI r5, 0x888888
LDI r17, 750
; arithmetic section
SUB r2, r14, r14
SUB r27, r15, r30
SUB r19, r20, r3
SUB r21, r22, r10
ADD r30, r11, r3
LDI r31, 0xFFFFFF
ADD r27, r16, r21
ADD r7, r9, r1
; main loop
loop_0:
  LDI r0, 16711680
  FILL r0
RECTF r22, r18, r31, r22, r7
RECTF r15, r26, r23, r23, r27
PSET r2, r16, r25
  CMP r8, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0