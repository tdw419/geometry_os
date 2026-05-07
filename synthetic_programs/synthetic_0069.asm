; Synthetic GeOS Program
; initialization
LDI r24, 901
LDI r30, 0xFF0000
; arithmetic section
SUB r24, r12, r22
SUB r31, r6, r30
LDI r7, 0x00FFFF
SUB r12, r5, r30
; main loop
loop_0:
  LDI r13, 0
  FILL r13
RECTF r4, r22, r1, r9, r19
  CMP r30, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0