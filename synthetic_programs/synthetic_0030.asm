; Synthetic GeOS Program
; initialization
LDI r27, 760
LDI r3, 605
LDI r12, 439
LDI r24, 0x00FF00
LDI r15, 0xFFFF00
; arithmetic section
LDI r30, 331
LDI r0, 424
LDI r30, 0xFFFF00
SUB r14, r31, r12
ADD r12, r4, r30
ADD r15, r16, r14
ADD r4, r30, r1
; main loop
loop_0:
  LDI r1, 255
  FILL r1
RECTF r16, r10, r21, r29, r14
RECTF r5, r12, r29, r25, r13
  CMP r17, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0