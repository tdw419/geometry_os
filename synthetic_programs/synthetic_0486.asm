; Synthetic GeOS Program
; initialization
LDI r4, 994
LDI r13, 738
LDI r27, 0xFFFFFF
LDI r10, 399
; arithmetic section
LDI r6, 0x000000
SUB r25, r16, r31
LDI r27, 138
; main loop
loop_0:
  LDI r16, 16777215
  FILL r16
RECTF r18, r22, r25, r6, r27
  CMP r9, r3
  JZ r0, loop_0
  FRAME
  JMP loop_0