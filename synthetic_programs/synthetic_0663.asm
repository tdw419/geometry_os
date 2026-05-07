; Synthetic GeOS Program
; initialization
LDI r0, 114
LDI r20, 401
LDI r27, 104
LDI r5, 391
LDI r18, 632
; arithmetic section
ADD r5, r23, r11
ADD r29, r8, r17
LDI r30, 0x00FFFF
; main loop
loop_0:
  LDI r31, 16711680
  FILL r31
RECTF r21, r13, r8, r18, r16
  FRAME
  JMP loop_0