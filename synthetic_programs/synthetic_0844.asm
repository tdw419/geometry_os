; Synthetic GeOS Program
; initialization
LDI r28, 566
LDI r13, 790
LDI r13, 0xFFFFFF
; arithmetic section
ADD r11, r14, r27
LDI r26, 68
LDI r29, 149
LDI r12, 0x0000FF
SUB r20, r4, r3
ADD r26, r16, r12
ADD r3, r31, r3
; main loop
loop_0:
  LDI r21, 8947848
  FILL r21
PSET r23, r15, r24
  CMP r15, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0