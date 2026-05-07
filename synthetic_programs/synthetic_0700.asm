; Synthetic GeOS Program
; initialization
LDI r21, 784
LDI r16, 150
LDI r31, 0xFFFF00
LDI r1, 0x00FFFF
LDI r8, 186
; main loop
loop_0:
  LDI r7, 255
  FILL r7
RECTF r6, r10, r26, r19, r8
  CMP r20, r17
  JZ r0, loop_0
  FRAME
  JMP loop_0