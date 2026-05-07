; input driven program
; initialization
  LDI r5, 78
  LDI r10, 2530
  LDI r4, 0xC399C2
  LDI r11, 0
main_0:
  SHL r2, r7, r11
  SHL r16, r4, r10
  SAR r1, r12, r31
  SHR r11, r8, r9
  ADD r14, r2, r5
  FRAME
  JMP main_0
