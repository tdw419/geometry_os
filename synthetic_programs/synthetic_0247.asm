; Synthetic GeOS Program
; initialization
LDI r4, 881
LDI r10, 122
LDI r15, 924
LDI r30, 565
; arithmetic section
SUB r8, r10, r26
LDI r17, 136
SUB r24, r13, r23
SUB r29, r30, r11
SUB r25, r10, r25
ADD r25, r5, r26
SUB r23, r17, r16
; main loop
loop_0:
  LDI r8, 65535
  FILL r8
CIRCLE r19, r2, r0, r4
PSET r28, r31, r16
  CMP r11, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0