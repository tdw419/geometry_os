; Synthetic GeOS Program
; initialization
LDI r17, 243
LDI r31, 182
; main loop
loop_0:
  LDI r0, 65535
  FILL r0
PSET r31, r24, r20
RECTF r16, r14, r30, r1, r8
RECTF r1, r13, r27, r12, r13
  CMP r25, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0