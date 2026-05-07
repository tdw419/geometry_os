; Synthetic GeOS Program
; initialization
LDI r8, 721
LDI r13, 379
LDI r17, 694
LDI r19, 684
LDI r6, 521
LDI r19, 900
; arithmetic section
LDI r2, 683
ADD r17, r11, r28
ADD r16, r21, r15
SUB r27, r27, r18
ADD r12, r19, r7
SUB r12, r20, r2
LDI r7, 924
; main loop
loop_0:
  LDI r21, 65535
  FILL r21
CIRCLE r15, r11, r28, r20
RECTF r3, r4, r16, r18, r27
  CMP r27, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0