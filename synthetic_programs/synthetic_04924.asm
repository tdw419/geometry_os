; input driven program
; initialization
  LDI r1, 0xB4E630
  LDI r12, 0xD508EB
  LDI r14, 0x31B169
  LDI r26, 0x94A9F2
  LDI r9, 10
  LDI r15, 128
  LDI r3, 3202
main_0:
  SAR r1, r15, r0
  SAR r5, r2, r8
  SHL r13, r7, r3
  SAR r10, r0, r2
  SHLI r4, r15, 6
  SHR r11, r3, r14
  FRAME
  JMP main_0
