; Synthetic GeOS Program
; initialization
LDI r1, 0xFFFF00
LDI r8, 201
; arithmetic section
ADD r21, r25, r6
LDI r15, 161
SUB r10, r17, r16
SUB r8, r11, r12
LDI r6, 0x00FF00
SUB r26, r22, r6
SUB r0, r9, r22
SUB r4, r0, r0
; main loop
loop_0:
  LDI r7, 0
  FILL r7
PSET r7, r4, r2
  CMP r7, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0