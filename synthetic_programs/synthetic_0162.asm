; Synthetic GeOS Program
; initialization
LDI r3, 439
LDI r0, 918
; arithmetic section
LDI r12, 244
SUB r22, r6, r4
LDI r27, 460
SUB r28, r6, r16
SUB r18, r3, r13
; main loop
loop_0:
  LDI r8, 255
  FILL r8
LINE r9, r10, r24, r31, r12
  FRAME
  JMP loop_0