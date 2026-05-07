; Synthetic GeOS Program
; initialization
LDI r3, 778
LDI r23, 793
; arithmetic section
ADD r22, r13, r16
LDI r3, 40
SUB r15, r9, r5
SUB r23, r11, r6
SUB r2, r22, r4
; main loop
loop_0:
  LDI r27, 16711935
  FILL r27
LINE r8, r24, r14, r16, r18
LINE r26, r17, r31, r30, r20
RECTF r29, r17, r24, r3, r28
  CMP r2, r21
  JZ r0, loop_0
  FRAME
  JMP loop_0