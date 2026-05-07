; Synthetic GeOS Program
; initialization
LDI r27, 0x00FFFF
LDI r14, 308
LDI r18, 236
LDI r28, 515
LDI r18, 0xFFFFFF
LDI r12, 352
; arithmetic section
ADD r11, r28, r7
SUB r19, r23, r31
LDI r18, 452
; main loop
loop_0:
  LDI r12, 16777215
  FILL r12
RECTF r10, r20, r23, r29, r1
LINE r15, r12, r2, r24, r9
CIRCLE r26, r21, r14, r24
  CMP r23, r25
  JZ r0, loop_0
  FRAME
  JMP loop_0