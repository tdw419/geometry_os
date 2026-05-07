; Synthetic GeOS Program
; initialization
LDI r29, 976
LDI r9, 642
LDI r6, 557
LDI r8, 936
; main loop
loop_0:
  LDI r0, 65280
  FILL r0
CIRCLE r6, r0, r1, r29
  CMP r18, r2
  JZ r0, loop_0
  FRAME
  JMP loop_0