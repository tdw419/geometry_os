; Synthetic GeOS Program
; initialization
LDI r28, 861
LDI r19, 766
LDI r5, 421
LDI r1, 0x000000
LDI r1, 803
LDI r18, 176
; arithmetic section
ADD r10, r6, r16
LDI r18, 725
ADD r9, r27, r31
LDI r15, 0xFF00FF
LDI r31, 0xFFFF00
LDI r0, 878
SUB r4, r25, r12
LDI r26, 216
; main loop
loop_0:
  LDI r18, 0
  FILL r18
PSET r30, r20, r29
LINE r25, r28, r31, r4, r13
RECTF r30, r9, r14, r20, r27
  FRAME
  JMP loop_0