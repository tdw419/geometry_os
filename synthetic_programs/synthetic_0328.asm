; Synthetic GeOS Program
; initialization
LDI r15, 593
LDI r26, 977
LDI r30, 926
; arithmetic section
LDI r1, 914
LDI r6, 80
LDI r8, 0xFF0000
ADD r28, r25, r1
; main loop
loop_0:
  LDI r9, 65535
  FILL r9
RECTF r25, r27, r26, r14, r6
LINE r29, r24, r10, r17, r12
LINE r27, r29, r6, r14, r26
  CMP r28, r29
  JZ r0, loop_0
  FRAME
  JMP loop_0