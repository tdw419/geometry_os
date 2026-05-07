; Synthetic GeOS Program
; initialization
LDI r13, 557
LDI r25, 757
LDI r30, 0x00FFFF
; arithmetic section
LDI r10, 588
ADD r17, r8, r18
SUB r21, r20, r27
; main loop
loop_0:
  LDI r6, 16711680
  FILL r6
PSET r6, r18, r4
CIRCLE r7, r15, r2, r6
PSET r9, r9, r29
  FRAME
  JMP loop_0