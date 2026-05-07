; Synthetic GeOS Program
; initialization
LDI r8, 14
LDI r27, 324
; arithmetic section
SUB r1, r30, r17
ADD r4, r16, r29
ADD r7, r24, r4
LDI r18, 886
ADD r21, r17, r22
SUB r10, r27, r25
SUB r1, r7, r22
ADD r10, r18, r23
; main loop
loop_0:
  LDI r19, 255
  FILL r19
RECTF r31, r29, r6, r28, r6
PSET r17, r16, r11
CIRCLE r3, r10, r15, r27
  CMP r15, r20
  JZ r0, loop_0
  FRAME
  JMP loop_0