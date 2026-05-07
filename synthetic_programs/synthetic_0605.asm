; Synthetic GeOS Program
; initialization
LDI r7, 521
LDI r16, 0x000000
LDI r25, 0xFFFF00
LDI r16, 806
LDI r8, 422
; arithmetic section
SUB r29, r14, r21
LDI r16, 820
ADD r17, r21, r12
LDI r22, 0x00FFFF
ADD r6, r11, r18
LDI r10, 595
; main loop
loop_0:
  LDI r16, 16711680
  FILL r16
LINE r6, r16, r28, r3, r18
  CMP r0, r26
  JZ r0, loop_0
  FRAME
  JMP loop_0