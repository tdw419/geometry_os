; Synthetic GeOS Program
; initialization
LDI r9, 778
LDI r8, 29
; arithmetic section
LDI r0, 978
SUB r12, r6, r24
ADD r0, r11, r7
LDI r18, 312
SUB r19, r19, r31
; main loop
loop_0:
  LDI r24, 16711680
  FILL r24
RECTF r16, r14, r17, r28, r16
LINE r31, r26, r18, r20, r10
PSET r10, r3, r21
  FRAME
  JMP loop_0