; Synthetic GeOS Program
; initialization
LDI r8, 179
LDI r13, 949
LDI r11, 0x00FFFF
; arithmetic section
SUB r17, r26, r31
LDI r16, 959
ADD r12, r9, r13
; main loop
loop_0:
  LDI r12, 0
  FILL r12
CIRCLE r16, r11, r19, r2
  FRAME
  JMP loop_0