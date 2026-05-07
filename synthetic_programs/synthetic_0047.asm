; Synthetic GeOS Program
; initialization
LDI r4, 0x00FFFF
LDI r10, 26
LDI r29, 717
LDI r15, 296
LDI r31, 63
; arithmetic section
SUB r26, r11, r13
LDI r26, 168
LDI r20, 162
ADD r9, r2, r7
ADD r13, r20, r9
ADD r16, r13, r13
; main loop
loop_0:
  LDI r14, 8947848
  FILL r14
PSET r13, r20, r30
RECTF r21, r0, r29, r5, r16
LINE r21, r27, r8, r23, r11
  CMP r5, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0