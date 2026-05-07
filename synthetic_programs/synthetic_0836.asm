; Synthetic GeOS Program
; initialization
LDI r14, 0x00FFFF
LDI r25, 443
LDI r2, 267
LDI r3, 1008
LDI r26, 576
LDI r4, 650
; arithmetic section
ADD r30, r30, r23
SUB r11, r20, r22
ADD r12, r17, r9
SUB r3, r20, r15
; main loop
loop_0:
  LDI r18, 16777215
  FILL r18
CIRCLE r9, r13, r8, r27
  FRAME
  JMP loop_0