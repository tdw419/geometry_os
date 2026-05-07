; counted animation
; initialization
  LDI r0, 16
  LDI r5, 2
  LDI r14, 1501
  LDI r2, 2453
  LDI r19, 2261
  LDI r8, 0
  LDI r21, 0x21EDBE
  LDI r10, 0xCA35D0
  LDI r9, 24
loop_0:
  LDI r5, 0x962982
  LDI r11, 64
  LDI r15, 0xE6F7CE
  LDI r12, 0xD1B4DE
  LDI r12, 0xCABCAB
  RECTF r5, r11, r15, r12, r12
  LDI r15, 1
  SUB r9, r9, r15
  JNZ r9, loop_0
  LDI r8, 0xA9D26C
loop_1:
  CMPI r11, r5, 0xA1AFC8
  LDI r5, 1
  SUB r8, r8, r5
  JNZ r8, loop_1
  HALT
