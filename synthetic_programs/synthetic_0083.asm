; Synthetic GeOS Program
; initialization
LDI r19, 804
LDI r21, 822
LDI r10, 16
LDI r21, 952
LDI r19, 945
LDI r24, 972
; main loop
loop_0:
  LDI r9, 16711935
  FILL r9
RECTF r16, r30, r6, r5, r14
  CMP r7, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0