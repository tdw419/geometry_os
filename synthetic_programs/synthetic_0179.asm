; Synthetic GeOS Program
; initialization
LDI r11, 871
LDI r22, 619
LDI r5, 445
LDI r20, 0x00FFFF
LDI r6, 130
; arithmetic section
LDI r5, 977
SUB r17, r17, r4
SUB r15, r0, r15
ADD r12, r31, r13
; main loop
loop_0:
  LDI r22, 16711680
  FILL r22
LINE r16, r25, r22, r13, r26
  FRAME
  JMP loop_0