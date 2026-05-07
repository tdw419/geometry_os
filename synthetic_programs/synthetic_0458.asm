; Synthetic GeOS Program
; initialization
LDI r31, 699
LDI r3, 993
LDI r14, 431
LDI r6, 225
LDI r0, 0x00FF00
LDI r28, 856
; arithmetic section
LDI r30, 0x000000
LDI r2, 124
ADD r23, r8, r21
LDI r21, 230
SUB r30, r17, r15
LDI r31, 186
LDI r0, 0xFFFF00
; main loop
loop_0:
  LDI r14, 16777215
  FILL r14
LINE r6, r14, r17, r24, r27
CIRCLE r20, r29, r27, r18
  CMP r31, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0