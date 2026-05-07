; Synthetic GeOS Program
; initialization
LDI r14, 893
LDI r27, 0x888888
LDI r16, 0xFF0000
LDI r27, 245
LDI r8, 0x00FFFF
LDI r3, 228
; arithmetic section
SUB r8, r4, r22
LDI r23, 459
LDI r6, 0x00FF00
SUB r5, r17, r8
LDI r23, 631
ADD r8, r4, r1
; main loop
loop_0:
  LDI r27, 8947848
  FILL r27
RECTF r10, r8, r3, r26, r11
PSET r24, r23, r14
LINE r31, r0, r19, r9, r20
  CMP r21, r1
  JZ r0, loop_0
  FRAME
  JMP loop_0