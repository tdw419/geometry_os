; Synthetic GeOS Program
; initialization
LDI r20, 191
LDI r7, 2
LDI r0, 0x888888
LDI r3, 0x888888
; arithmetic section
LDI r6, 0xFFFFFF
SUB r22, r30, r14
SUB r22, r8, r9
ADD r25, r26, r11
LDI r13, 668
SUB r21, r13, r10
LDI r1, 0xFFFFFF
LDI r18, 583
; main loop
loop_0:
  LDI r1, 16711680
  FILL r1
PSET r26, r27, r2
PSET r10, r18, r23
CIRCLE r6, r18, r14, r9
  CMP r15, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0