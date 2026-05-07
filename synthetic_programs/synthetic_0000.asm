; Synthetic GeOS Program
; initialization
LDI r11, 879
LDI r18, 911
LDI r13, 526
LDI r29, 894
; arithmetic section
LDI r27, 213
SUB r15, r8, r21
LDI r0, 307
SUB r20, r24, r10
SUB r9, r23, r9
; main loop
loop_0:
  LDI r30, 65280
  FILL r30
CIRCLE r30, r24, r1, r25
  FRAME
  JMP loop_0