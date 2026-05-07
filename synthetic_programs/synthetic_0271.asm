; Synthetic GeOS Program
; initialization
LDI r0, 477
LDI r23, 0x00FFFF
; arithmetic section
SUB r18, r27, r19
SUB r4, r19, r30
ADD r10, r3, r25
; main loop
loop_0:
  LDI r1, 16777215
  FILL r1
PSET r9, r27, r4
LINE r16, r3, r13, r22, r23
  CMP r25, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0