; Synthetic GeOS Program
; initialization
LDI r22, 307
LDI r0, 514
LDI r22, 88
; arithmetic section
LDI r27, 677
LDI r7, 715
SUB r6, r11, r14
LDI r20, 165
LDI r17, 823
; main loop
loop_0:
  LDI r17, 16711680
  FILL r17
CIRCLE r13, r30, r5, r18
PSET r27, r0, r12
  CMP r12, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0