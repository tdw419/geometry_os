; input driven program
; initialization
  LDI r14, 255
  LDI r12, 0x4F545F
  LDI r7, 3425
  LDI r0, 2675
  LDI r1, 0x6A13B1
  LDI r4, 3660
  LDI r10, 0xACE0EE
  LDI r5, 64
main_0:
  LDI r11, 4
  LDI r31, 3319
  LDI r12, 476
  TEXT r11, r31, r12, "HELLO"
  CMP r7, r12
  LDI r6, 3112
  LDI r14, 0x7C1689
  LDI r9, 2
  TEXT r6, r14, r9, "HELLO"
  SAR r19, r6, r14
  SHLI r9, r0, 8
  SAR r14, r11, r1
  CMP r6, r1
  LDI r0, 0xE44DDF
  LDI r12, 0x1218DD
  LDI r14, 128
  PSETI
  FRAME
  JMP main_0
