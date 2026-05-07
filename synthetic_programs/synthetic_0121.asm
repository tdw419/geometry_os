; Synthetic GeOS Program
; initialization
LDI r0, 973
LDI r31, 0x000000
LDI r3, 820
LDI r0, 0x00FF00
LDI r26, 190
; arithmetic section
SUB r4, r0, r0
SUB r7, r16, r19
SUB r27, r30, r2
SUB r8, r27, r5
; main loop
loop_0:
  LDI r27, 16777215
  FILL r27
RECTF r0, r12, r8, r15, r17
CIRCLE r8, r24, r8, r28
LINE r13, r16, r0, r14, r30
  CMP r15, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0