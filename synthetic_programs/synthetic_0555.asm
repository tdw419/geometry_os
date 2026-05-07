; Synthetic GeOS Program
; initialization
LDI r11, 196
LDI r11, 0xFFFFFF
LDI r1, 473
LDI r11, 697
LDI r24, 309
; arithmetic section
SUB r28, r26, r27
ADD r25, r20, r21
ADD r15, r6, r14
LDI r5, 0xFFFF00
SUB r7, r16, r14
ADD r6, r3, r16
; main loop
loop_0:
  LDI r15, 65535
  FILL r15
LINE r28, r23, r23, r1, r27
LINE r11, r12, r18, r3, r11
  CMP r31, r31
  JZ r0, loop_0
  FRAME
  JMP loop_0