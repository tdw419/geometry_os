; Synthetic GeOS Program
; initialization
LDI r6, 70
LDI r8, 829
LDI r16, 63
LDI r12, 739
LDI r2, 239
LDI r26, 0x000000
; arithmetic section
SUB r11, r2, r1
SUB r0, r14, r29
LDI r13, 0x00FFFF
SUB r24, r0, r30
LDI r14, 0x00FF00
SUB r29, r31, r27
LDI r26, 856
SUB r19, r17, r26
; main loop
loop_0:
  LDI r1, 16711680
  FILL r1
CIRCLE r1, r2, r6, r5
PSET r10, r30, r6
CIRCLE r4, r5, r31, r15
  CMP r23, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0