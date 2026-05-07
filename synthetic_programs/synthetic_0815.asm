; Synthetic GeOS Program
; initialization
LDI r20, 426
LDI r13, 843
LDI r19, 410
LDI r6, 581
; main loop
loop_0:
  LDI r30, 16777215
  FILL r30
CIRCLE r17, r5, r30, r25
CIRCLE r21, r12, r17, r29
  FRAME
  JMP loop_0