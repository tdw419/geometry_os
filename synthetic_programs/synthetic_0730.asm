; Synthetic GeOS Program
; initialization
LDI r12, 30
LDI r9, 200
LDI r20, 309
LDI r15, 207
LDI r11, 514
; arithmetic section
ADD r9, r12, r27
LDI r12, 837
SUB r19, r20, r28
LDI r28, 101
LDI r15, 1002
SUB r3, r22, r29
ADD r31, r23, r31
SUB r0, r14, r3
; main loop
loop_0:
  LDI r18, 16777215
  FILL r18
CIRCLE r23, r23, r11, r7
  CMP r15, r6
  JZ r0, loop_0
  FRAME
  JMP loop_0