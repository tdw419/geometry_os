; input driven program
; initialization
  LDI r20, 0x76D05C
  LDI r13, 1455
  LDI r3, 32
  LDI r6, 64
  LDI r5, 0xD82CF0
  LDI r11, 16
  LDI r4, 2152
main_0:
  OR r29, r11, r0
  CMPI r8, r1, 4
  SHR r1, r10, r12
  SHLI r7, r13, 64
  SHLI r22, r2, 4
  ADD r11, r3, r4
  FRAME
  JMP main_0
