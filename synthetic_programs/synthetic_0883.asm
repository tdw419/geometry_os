; Synthetic GeOS Program
; initialization
LDI r7, 250
LDI r20, 59
LDI r9, 0x00FFFF
LDI r28, 0x000000
; main loop
loop_0:
  LDI r15, 16777215
  FILL r15
PSET r21, r9, r31
PSET r24, r4, r21
  FRAME
  JMP loop_0