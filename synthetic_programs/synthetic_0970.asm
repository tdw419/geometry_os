; Synthetic GeOS Program
; initialization
LDI r19, 692
LDI r26, 0xFFFF00
LDI r24, 4
LDI r21, 0xFFFF00
LDI r28, 19
; arithmetic section
ADD r23, r21, r26
SUB r18, r13, r20
LDI r1, 139
LDI r16, 715
LDI r2, 868
SUB r29, r1, r15
LDI r25, 0x00FFFF
; main loop
loop_0:
  LDI r10, 8947848
  FILL r10
LINE r31, r16, r3, r13, r5
RECTF r21, r9, r20, r31, r22
RECTF r9, r18, r29, r3, r3
  CMP r26, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0