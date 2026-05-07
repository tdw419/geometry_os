; Synthetic GeOS Program
; initialization
LDI r7, 0xFFFFFF
LDI r16, 151
; main loop
loop_0:
  LDI r27, 16711680
  FILL r27
RECTF r15, r8, r18, r20, r10
PSET r9, r8, r26
  FRAME
  JMP loop_0