; input driven program
; initialization
  LDI r12, 1866
  LDI r2, 1796
  LDI r5, 0x517CE7
  LDI r8, 0x5DDCAC
  LDI r7, 0x374E05
main_0:
  MOD r26, r11, r8
  CMP r12, r11
  FRAME
  JMP main_0
