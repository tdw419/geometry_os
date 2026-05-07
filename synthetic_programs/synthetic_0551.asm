; Synthetic GeOS Program
; initialization
LDI r3, 866
LDI r19, 926
; arithmetic section
SUB r25, r28, r7
LDI r10, 959
SUB r9, r31, r28
ADD r15, r9, r30
ADD r14, r24, r10
SUB r10, r2, r11
; main loop
loop_0:
  LDI r0, 16777215
  FILL r0
LINE r30, r11, r10, r28, r30
PSET r7, r6, r2
CIRCLE r23, r29, r14, r29
  CMP r27, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0