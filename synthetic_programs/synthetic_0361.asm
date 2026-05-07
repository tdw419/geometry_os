; Synthetic GeOS Program
; initialization
LDI r22, 935
LDI r16, 982
LDI r19, 294
LDI r9, 0x888888
LDI r18, 833
; main loop
loop_0:
  LDI r29, 65535
  FILL r29
PSET r30, r12, r12
  CMP r17, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0