; Synthetic GeOS Program
; initialization
LDI r23, 0xFFFFFF
LDI r31, 0x0000FF
; arithmetic section
ADD r25, r9, r28
ADD r8, r4, r9
ADD r19, r0, r11
SUB r10, r7, r16
SUB r13, r29, r25
ADD r19, r16, r8
SUB r29, r18, r3
; main loop
loop_0:
  LDI r23, 16711680
  FILL r23
PSET r11, r14, r23
LINE r31, r17, r10, r9, r16
LINE r26, r13, r6, r10, r9
  FRAME
  JMP loop_0