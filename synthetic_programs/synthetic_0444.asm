; Synthetic GeOS Program
; initialization
LDI r8, 152
LDI r3, 905
LDI r9, 0x000000
LDI r4, 0x00FFFF
LDI r17, 158
; arithmetic section
SUB r15, r21, r1
SUB r9, r24, r9
SUB r6, r20, r18
ADD r12, r17, r15
; main loop
loop_0:
  LDI r15, 16776960
  FILL r15
RECTF r17, r31, r9, r16, r31
RECTF r9, r18, r30, r27, r4
  CMP r14, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0