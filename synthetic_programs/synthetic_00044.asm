; drawing loop program
; initialization
  LDI r3, 846
  LDI r2, 32
  LDI r15, 0x0071B9
  LDI r12, 0xA8DF97
  LDI r0, 4019
  LDI r11, 0
  LDI r10, 0xEB55D9
  LDI r9, 0
main_0:
  SHLI r11, r14, 4
  SHL r7, r2, r9
  SHLI r14, r16, 0x1CB32B
  SAR r1, r6, r14
  CMPI r2, 0x487E8B
  LDI r15, 1988
  LDI r4, 0x199418
  LDI r3, 128
  TEXT r15, r4, r3, "HELLO"
  FRAME
  JMP main_0
