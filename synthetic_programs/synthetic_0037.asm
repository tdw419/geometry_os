; Synthetic GeOS Program
; initialization
LDI r26, 619
LDI r22, 387
LDI r7, 0x00FFFF
LDI r9, 208
LDI r5, 545
LDI r4, 325
; arithmetic section
LDI r31, 396
SUB r27, r16, r29
SUB r6, r2, r21
; main loop
loop_0:
  LDI r21, 16777215
  FILL r21
RECTF r21, r27, r21, r8, r5
CIRCLE r10, r16, r6, r12
RECTF r29, r15, r13, r25, r17
  FRAME
  JMP loop_0