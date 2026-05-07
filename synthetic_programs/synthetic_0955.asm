; Synthetic GeOS Program
; initialization
LDI r31, 0x000000
LDI r23, 52
LDI r2, 0x888888
; arithmetic section
ADD r18, r29, r19
SUB r21, r21, r25
LDI r6, 835
LDI r18, 238
LDI r31, 832
SUB r22, r28, r16
SUB r21, r11, r12
; main loop
loop_0:
  LDI r16, 255
  FILL r16
CIRCLE r26, r26, r22, r18
  CMP r3, r16
  JZ r0, loop_0
  FRAME
  JMP loop_0