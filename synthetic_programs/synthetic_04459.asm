; drawing loop program
; initialization
  LDI r12, 3798
  LDI r0, 3250
  LDI r7, 16
  LDI r14, 2452
  LDI r2, 256
  LDI r30, 128
  LDI r5, 0x20A1B8
  LDI r8, 10
; palette
  LDI r0, 0x6025
  LDI r31, 1
  LDI r9, 0x8800FF
  STORE r0, r9
  ADD r0, r0, r31
  LDI r9, 0x0000CC
  STORE r0, r9
  ADD r0, r0, r31
  LDI r9, 0x0044FF
  STORE r0, r9
  ADD r0, r0, r31
  LDI r9, 0xFFAA00
  STORE r0, r9
  ADD r0, r0, r31
main_0:
  LDI r0, 0xD60FA5
  LDI r6, 256
  LDI r9, 2300
  TEXT r0, r6, r9, "HELLO"
  SAR r15, r8, r1
  SHLI r15, r14, 8
  MOD r0, r5, r7
  CMPI r19, 118
  IKEY r3
  CMPI r3, 18
  JNZ r3, key_1
  ADDI r14, r23, 169
  FRAME
  JMP main_0
