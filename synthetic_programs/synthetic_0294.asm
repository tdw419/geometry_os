; Synthetic GeOS Program
; initialization
LDI r12, 840
LDI r15, 473
LDI r10, 608
LDI r17, 11
LDI r7, 0xFFFFFF
; arithmetic section
LDI r11, 958
LDI r16, 902
ADD r31, r30, r2
LDI r12, 768
LDI r11, 386
SUB r26, r11, r2
ADD r17, r26, r28
LDI r29, 620
; main loop
loop_0:
  LDI r8, 8947848
  FILL r8
CIRCLE r16, r24, r5, r26
CIRCLE r2, r14, r5, r0
  FRAME
  JMP loop_0