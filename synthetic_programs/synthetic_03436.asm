; input driven program
; initialization
  LDI r7, 0xFE5785
  LDI r5, 139
  LDI r9, 1587
  LDI r6, 64
main_0:
  CMP r14, r12
  CMPI r10, r16, 0x52AA04
  MOD r14, r6, r13
  SAR r5, r15, r11
  SHLI r9, r0, 0x253824
  SHR r9, r13, r2
  SHL r9, r1, r2
  SHLI r13, r1, 0
  SHL r0, r2, r10
  SHLI r15, r8, 128
  SHL r15, r5, r11
  FRAME
  JMP main_0
