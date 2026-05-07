; Synthetic GeOS Program
; initialization
LDI r25, 630
LDI r15, 79
; arithmetic section
LDI r29, 0xFFFFFF
LDI r4, 971
ADD r22, r24, r20
LDI r16, 329
SUB r29, r17, r4
SUB r15, r7, r26
LDI r9, 382
SUB r0, r30, r6
; main loop
loop_0:
  LDI r9, 16777215
  FILL r9
LINE r27, r27, r24, r28, r14
  CMP r8, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0