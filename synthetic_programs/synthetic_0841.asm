; Synthetic GeOS Program
; initialization
LDI r19, 886
LDI r29, 728
LDI r0, 259
; arithmetic section
LDI r2, 0x00FF00
SUB r4, r19, r28
SUB r7, r26, r23
SUB r19, r17, r18
ADD r25, r20, r2
ADD r19, r11, r5
LDI r15, 405
ADD r0, r17, r21
; main loop
loop_0:
  LDI r6, 8947848
  FILL r6
PSET r17, r19, r25
LINE r15, r23, r25, r28, r2
  CMP r8, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0