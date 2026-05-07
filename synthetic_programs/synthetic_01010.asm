; mixed program
; initialization
  LDI r7, 0x689D30
  LDI r5, 463
  LDI r15, 0x1986AF
  LDI r8, 3704
; palette
  LDI r5, 0x70B7
  LDI r14, 1
  LDI r15, 0xAA00AA
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x888800
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x44FF00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xAA00AA
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFF0000
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFF0000
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x000000
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xDD0044
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x0044FF
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFFEE00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xAAFF00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFFFF00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFF4400
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x000000
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x0000CC
  STORE r5, r15
  ADD r5, r5, r14
  DIV r15, r6, r14
  LDI r2, 2173
  STORE r2, r5
  LOAD r15, r2
  LDI r3, 0xA671CB
  STORE r3, r11
  LOAD r6, r3
  LDI r0x24750, 0x24756
  STORE r10, r15
  LOAD r3, r10
  LDI r14, 1
  STORE r14, r4
  LOAD r11, r14
  LDI r5, 1635
  STORE r5, r1
  LOAD r0, r5
  LDI r7, 0x4CF47B
loop_0:
  LDI r12, 64
  LDI r0, 3930
  LDI r6, 0xF91F99
  PSET r12, r0, r6
  LDI r6, 0xE7E176
  LDI r9, 2355
  LDI r4, 8
  LDI r9, 0x14777C
  LDI r0, 16
  LINE r6, r9, r4, r9, r0
  LDI r5, 1
  SUB r7, r7, r5
  JNZ r7, loop_0
  LDI r2, 7
loop_1:
  SUBI r5, r2, 65
  LDI r14, 1
  LDI r10, 1
  LDI r11, 0
  PSETI
  SHR r10, r8, r11
  SUB r14, r13, r2
  LDI r0, 1
  SUB r2, r2, r0
  JNZ r2, loop_1
  IKEY r19
  CMPI r19, 0
  JNZ r19, key_2
  SHR r0, r3, r15
  SAR r15, r3, r12
  CMPI r8, 237
  IKEY r2
  CMPI r2, 27
  JNZ r2, key_3
  HALT
