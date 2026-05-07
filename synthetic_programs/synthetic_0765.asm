; Synthetic GeOS Program
; initialization
LDI r19, 1015
LDI r14, 337
LDI r2, 39
LDI r31, 298
LDI r11, 582
LDI r14, 487
; arithmetic section
ADD r11, r15, r20
LDI r0, 547
SUB r23, r16, r1
ADD r24, r24, r10
LDI r28, 632
ADD r26, r13, r4
; main loop
loop_0:
  LDI r13, 16777215
  FILL r13
RECTF r14, r7, r17, r19, r29
  CMP r21, r27
  JZ r0, loop_0
  FRAME
  JMP loop_0