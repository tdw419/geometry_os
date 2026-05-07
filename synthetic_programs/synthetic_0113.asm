; Synthetic GeOS Program
; initialization
LDI r24, 411
LDI r6, 1004
LDI r6, 0x888888
; arithmetic section
LDI r10, 371
SUB r1, r2, r5
ADD r8, r10, r11
ADD r26, r1, r2
ADD r8, r31, r20
LDI r0, 945
; main loop
loop_0:
  LDI r10, 255
  FILL r10
PSET r30, r16, r24
  CMP r16, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0