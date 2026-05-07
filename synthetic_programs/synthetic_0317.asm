; Synthetic GeOS Program
; initialization
LDI r16, 168
LDI r22, 945
LDI r31, 216
; arithmetic section
SUB r22, r6, r8
LDI r26, 739
SUB r16, r28, r12
LDI r11, 319
SUB r2, r14, r2
; main loop
loop_0:
  LDI r1, 16777215
  FILL r1
LINE r19, r27, r2, r0, r30
  FRAME
  JMP loop_0