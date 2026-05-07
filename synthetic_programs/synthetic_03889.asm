; drawing loop program
; initialization
  LDI r11, 0xBB0516
  LDI r0, 1
main_0:
  CMPI r5, 112
  MOD r14, r10, r4
  AND r11, r3, r0
  FRAME
  JMP main_0
