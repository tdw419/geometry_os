; Synthetic GeOS Program
; initialization
LDI r10, 28
LDI r5, 0xFFFFFF
LDI r6, 0x00FFFF
LDI r8, 295
LDI r5, 931
; arithmetic section
SUB r2, r15, r4
SUB r8, r17, r6
SUB r8, r0, r23
LDI r21, 601
ADD r5, r3, r7
SUB r0, r23, r9
; main loop
loop_0:
  LDI r11, 16776960
  FILL r11
RECTF r16, r18, r20, r20, r18
RECTF r13, r11, r7, r30, r18
LINE r29, r29, r11, r21, r21
  CMP r27, r7
  JZ r0, loop_0
  FRAME
  JMP loop_0