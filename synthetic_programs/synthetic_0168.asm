; Synthetic GeOS Program
; initialization
LDI r10, 927
LDI r27, 987
LDI r6, 539
LDI r18, 0x00FFFF
LDI r20, 132
LDI r15, 0xFFFF00
; main loop
loop_0:
  LDI r31, 16777215
  FILL r31
CIRCLE r13, r11, r18, r26
LINE r8, r12, r10, r28, r0
PSET r29, r28, r11
  FRAME
  JMP loop_0