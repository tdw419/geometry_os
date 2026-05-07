; Synthetic GeOS Program
; initialization
LDI r29, 0xFFFFFF
LDI r31, 0x888888
LDI r18, 169
LDI r18, 34
LDI r2, 893
LDI r0, 0x000000
; main loop
loop_0:
  LDI r29, 65535
  FILL r29
RECTF r19, r4, r27, r15, r11
RECTF r4, r15, r8, r7, r25
  FRAME
  JMP loop_0