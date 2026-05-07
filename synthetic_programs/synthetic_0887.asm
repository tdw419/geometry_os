; Synthetic GeOS Program
; initialization
LDI r12, 0xFFFFFF
LDI r28, 308
LDI r6, 96
LDI r20, 0x00FFFF
LDI r0, 717
LDI r23, 0x0000FF
; arithmetic section
ADD r5, r16, r16
SUB r31, r0, r30
ADD r3, r21, r5
ADD r26, r22, r18
ADD r10, r21, r22
; main loop
loop_0:
  LDI r17, 65535
  FILL r17
PSET r19, r9, r24
LINE r1, r20, r15, r11, r24
LINE r24, r6, r6, r8, r22
  FRAME
  JMP loop_0