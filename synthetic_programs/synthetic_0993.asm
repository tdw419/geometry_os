; Synthetic GeOS Program
; initialization
LDI r17, 0x0000FF
LDI r6, 479
LDI r12, 724
LDI r29, 793
; main loop
loop_0:
  LDI r10, 65280
  FILL r10
LINE r2, r26, r26, r9, r8
LINE r25, r6, r22, r25, r31
LINE r22, r11, r28, r29, r10
  CMP r6, r23
  JZ r0, loop_0
  FRAME
  JMP loop_0