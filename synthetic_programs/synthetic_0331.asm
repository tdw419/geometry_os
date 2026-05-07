; Synthetic GeOS Program
; initialization
LDI r26, 929
LDI r28, 23
LDI r19, 791
LDI r20, 844
LDI r10, 275
; arithmetic section
SUB r29, r27, r19
SUB r30, r30, r18
LDI r16, 224
ADD r5, r30, r0
SUB r12, r19, r11
LDI r24, 363
SUB r15, r20, r10
SUB r5, r23, r2
; main loop
loop_0:
  LDI r1, 16711935
  FILL r1
PSET r29, r31, r25
LINE r6, r5, r23, r20, r1
  CMP r11, r14
  JZ r0, loop_0
  FRAME
  JMP loop_0