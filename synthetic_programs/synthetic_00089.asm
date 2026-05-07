; input driven program
; initialization
  LDI r7, 883
  LDI r8, 0
  LDI r5, 1625
  LDI r20, 0xAA9242
main_0:
  MOD r4, r14, r5
  SHL r6, r7, r11
  SHL r11, r12, r15
  SHLI r7, r3, 2
  FRAME
  JMP main_0
