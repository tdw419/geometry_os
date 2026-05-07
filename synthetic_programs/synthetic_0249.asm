; Synthetic GeOS Program
; initialization
LDI r10, 0x00FFFF
LDI r28, 818
LDI r10, 46
LDI r7, 632
; arithmetic section
SUB r13, r0, r6
ADD r12, r22, r10
ADD r8, r14, r21
SUB r7, r28, r12
ADD r22, r30, r9
; main loop
loop_0:
  LDI r17, 0
  FILL r17
LINE r26, r22, r19, r15, r3
LINE r19, r27, r29, r17, r1
  CMP r25, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0