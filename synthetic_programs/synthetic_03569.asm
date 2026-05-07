; mixed program
; initialization
  LDI r12, 0
  LDI r0, 0xD36F1D
  LDI r1, 811
  LDI r14, 0xAAFD2E
; palette
  LDI r5, 0x2478
  LDI r12, 1
  LDI r2, 0xDD0044
  STORE r5, r2
  ADD r5, r5, r12
  LDI r2, 0xAAAAAA
  STORE r5, r2
  ADD r5, r5, r12
  LDI r2, 0xDD0044
  STORE r5, r2
  ADD r5, r5, r12
  LDI r2, 0x0044FF
  STORE r5, r2
  ADD r5, r5, r12
  LDI r2, 0xFFAA00
  STORE r5, r2
  ADD r5, r5, r12
  SAR r9, r6, r30
  SHR r13, r12, r7
  MOD r2, r10, r3
  OR r15, r12, r13
  OR r2, r13, r7
  OR r9, r12, r3
  AND r4, r10, r5
  IKEY r23
  CMPI r23, 128
  JNZ r23, key_0
  LDI r12, 4
loop_1:
  SUBI r3, r7, 239
  SUBI r11, r1, 2
  SUBI r14, r10, 1
  ANDI r5, r23, 0x4179B9
  LDI r3, 1
  SUB r12, r12, r3
  JNZ r12, loop_1
main_2:
  SAR r6, r11, r22
  SHLI r6, r13, 10
  SHR r7, r15, r12
  SHLI r12, r5, 0xD75557
  MOD r9, r20, r4
  CMP r13, r11
  AND r4, r5, r15
  OR r3, r9, r1
  FRAME
  JMP main_2
