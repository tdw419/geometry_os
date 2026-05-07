; Synthetic GeOS Program
; initialization
LDI r12, 301
LDI r17, 897
LDI r19, 97
LDI r21, 398
LDI r11, 264
; arithmetic section
ADD r21, r12, r23
LDI r18, 895
SUB r4, r28, r21
; main loop
loop_0:
  LDI r26, 16711935
  FILL r26
LINE r9, r18, r9, r0, r30
CIRCLE r14, r15, r7, r15
LINE r7, r18, r13, r4, r23
  FRAME
  JMP loop_0