; Synthetic GeOS Program
; initialization
LDI r28, 265
LDI r7, 349
LDI r14, 539
LDI r2, 675
LDI r29, 42
LDI r8, 396
; main loop
loop_0:
  LDI r26, 65535
  FILL r26
PSET r6, r18, r23
  FRAME
  JMP loop_0