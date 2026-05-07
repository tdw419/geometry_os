; Synthetic GeOS Program
; initialization
LDI r16, 304
LDI r0, 199
LDI r3, 0x00FFFF
; main loop
loop_0:
  LDI r22, 16777215
  FILL r22
CIRCLE r8, r25, r20, r6
CIRCLE r24, r1, r14, r28
PSET r5, r6, r10
  CMP r13, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0