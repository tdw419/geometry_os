; drawing loop program
; initialization
  LDI r5, 256
  LDI r12, 128
  LDI r3, 550
  LDI r30, 0x6C8B58
  LDI r11, 64
  LDI r13, 2
; palette
  LDI r0, 0x24B7
  LDI r4, 1
  LDI r12, 0x888800
  STORE r0, r12
  ADD r0, r0, r4
  LDI r12, 0xDD0044
  STORE r0, r12
  ADD r0, r0, r4
  LDI r12, 0xDD0044
  STORE r0, r12
  ADD r0, r0, r4
  LDI r12, 0x880088
  STORE r0, r12
  ADD r0, r0, r4
  LDI r12, 0xFFEE00
  STORE r0, r12
  ADD r0, r0, r4
main_0:
  ADDI r14, r13, 32
  CMP r15, r14
  CMPI r3, r8, 0x19F2F4
  OR r1, r15, r0
  AND r9, r7, r10
  XOR r4, r2, r14
  AND r4, r14, r2
  AND r2, r14, r12
  XOR r13, r11, r7
  IKEY r11
  CMPI r11, 0xC1F9D2
  JNZ r11, key_1
  FRAME
  JMP main_0
