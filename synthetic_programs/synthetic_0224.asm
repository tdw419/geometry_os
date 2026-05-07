; Synthetic GeOS Program
; initialization
LDI r17, 699
LDI r11, 0x00FFFF
LDI r0, 0x00FFFF
LDI r13, 712
LDI r24, 0x00FFFF
; arithmetic section
LDI r10, 0xFF00FF
LDI r13, 645
LDI r23, 801
ADD r26, r5, r6
ADD r17, r12, r23
LDI r24, 591
ADD r22, r8, r14
; main loop
loop_0:
  LDI r14, 0
  FILL r14
LINE r31, r13, r24, r17, r16
PSET r0, r4, r27
PSET r16, r21, r1
  FRAME
  JMP loop_0