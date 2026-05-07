; Synthetic GeOS Program
; initialization
LDI r19, 165
LDI r29, 0x00FFFF
LDI r3, 675
; arithmetic section
ADD r25, r31, r24
SUB r11, r0, r13
SUB r27, r14, r30
LDI r16, 995
SUB r18, r5, r25
SUB r27, r29, r21
; main loop
loop_0:
  LDI r21, 16711935
  FILL r21
CIRCLE r4, r8, r19, r5
  CMP r12, r4
  JZ r0, loop_0
  FRAME
  JMP loop_0