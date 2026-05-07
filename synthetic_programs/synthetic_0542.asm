; Synthetic GeOS Program
; initialization
LDI r8, 189
LDI r16, 164
LDI r15, 734
LDI r22, 124
LDI r23, 0xFFFFFF
LDI r29, 295
; arithmetic section
LDI r3, 843
LDI r17, 827
ADD r11, r18, r15
SUB r8, r10, r0
; main loop
loop_0:
  LDI r2, 8947848
  FILL r2
RECTF r17, r4, r15, r16, r22
  CMP r30, r19
  JZ r0, loop_0
  FRAME
  JMP loop_0