; Synthetic GeOS Program
; initialization
LDI r21, 214
LDI r26, 429
LDI r13, 0x00FFFF
LDI r29, 413
LDI r20, 410
; main loop
loop_0:
  LDI r1, 255
  FILL r1
PSET r12, r28, r1
  FRAME
  JMP loop_0