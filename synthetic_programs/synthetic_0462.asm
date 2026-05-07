; Synthetic GeOS Program
; initialization
LDI r7, 323
LDI r18, 760
LDI r19, 911
LDI r18, 606
; arithmetic section
ADD r12, r14, r26
ADD r10, r3, r29
SUB r11, r31, r6
SUB r21, r30, r9
SUB r11, r9, r6
SUB r27, r29, r8
ADD r16, r3, r17
SUB r20, r7, r14
; main loop
loop_0:
  LDI r29, 0
  FILL r29
PSET r23, r23, r25
LINE r13, r3, r15, r15, r17
  CMP r3, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0