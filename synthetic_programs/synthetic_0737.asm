; Synthetic GeOS Program
; initialization
LDI r15, 980
LDI r17, 950
LDI r9, 886
LDI r5, 326
LDI r9, 829
LDI r1, 182
; main loop
loop_0:
  LDI r13, 16711680
  FILL r13
LINE r29, r25, r6, r11, r15
LINE r18, r3, r25, r6, r25
  CMP r15, r18
  JZ r0, loop_0
  FRAME
  JMP loop_0