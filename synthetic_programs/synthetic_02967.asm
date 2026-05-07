; mixed program
; initialization
  LDI r23, 0x14D4AD
  LDI r8, 0x5BB84D
  LDI r2, 2836
  LDI r3, 2258
  LDI r4, 0
  ADD r10, r12, r6
  OR r13, r2, r1
  LDI r1, 0xE7D1B9
  FILL r1
  IKEY r9
  CMPI r9, 0xEE30C2
  JNZ r9, key_0
  AND r6, r10, r20
  OR r13, r8, r9
  OR r6, r10, r29
  HALT
