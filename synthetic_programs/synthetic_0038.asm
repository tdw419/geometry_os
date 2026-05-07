; Synthetic GeOS Program
; initialization
LDI r12, 236
LDI r19, 0x00FFFF
LDI r8, 154
LDI r10, 68
LDI r14, 5
; arithmetic section
LDI r30, 995
SUB r14, r16, r31
SUB r23, r5, r30
LDI r25, 164
LDI r6, 483
LDI r6, 0x000000
LDI r1, 1002
; main loop
loop_0:
  LDI r21, 16711935
  FILL r21
CIRCLE r28, r1, r5, r8
  FRAME
  JMP loop_0