; Synthetic GeOS Program
; initialization
LDI r15, 0x00FF00
LDI r8, 732
LDI r22, 0xFFFF00
LDI r16, 0x0000FF
LDI r19, 567
LDI r14, 0x00FFFF
; arithmetic section
LDI r17, 818
ADD r18, r7, r10
LDI r31, 359
SUB r1, r3, r1
ADD r20, r31, r28
LDI r4, 681
; main loop
loop_0:
  LDI r14, 16776960
  FILL r14
RECTF r24, r30, r20, r7, r30
RECTF r27, r20, r25, r30, r11
  CMP r6, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0