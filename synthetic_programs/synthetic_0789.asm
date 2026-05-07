; Synthetic GeOS Program
; initialization
LDI r24, 783
LDI r7, 825
LDI r24, 0x000000
LDI r18, 918
LDI r19, 199
; arithmetic section
ADD r28, r29, r11
LDI r5, 256
LDI r12, 884
ADD r24, r13, r1
SUB r22, r20, r10
ADD r10, r29, r5
; main loop
loop_0:
  LDI r27, 16711935
  FILL r27
CIRCLE r15, r7, r24, r17
  CMP r24, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0