; Synthetic GeOS Program
; initialization
LDI r12, 537
LDI r19, 0x00FFFF
LDI r0, 657
LDI r3, 290
LDI r22, 259
LDI r22, 108
; main loop
loop_0:
  LDI r24, 255
  FILL r24
PSET r31, r3, r6
CIRCLE r5, r14, r30, r18
RECTF r26, r20, r31, r30, r7
  CMP r3, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0