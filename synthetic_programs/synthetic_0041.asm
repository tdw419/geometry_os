; Synthetic GeOS Program
; initialization
LDI r29, 0x000000
LDI r9, 218
LDI r15, 211
LDI r6, 926
; main loop
loop_0:
  LDI r16, 16711935
  FILL r16
PSET r9, r17, r5
LINE r14, r18, r25, r11, r24
  CMP r30, r5
  JZ r0, loop_0
  FRAME
  JMP loop_0