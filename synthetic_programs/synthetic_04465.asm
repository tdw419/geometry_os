; counted animation
; initialization
  LDI r9, 0x37710F
  LDI r13, 580
  LDI r12, 518
  LDI r17, 0x02D9B2
  LDI r10, 32
  LDI r7, 256
  LDI r2, 0xEEBED8
loop_0:
  LDI r12, 4076
  LDI r1, 3878
  LDI r5, 4063
  LDI r30, 0x85638D
  LDI r10, 2304
  RECTF r12, r1, r5, r30, r10
  LDI r8, 0x755530
  LDI r13, 2799
  LDI r4, 1231
  PSETI
  OR r1, r2, r3
  LDI r6, 32
  FILL r6
  LDI r9, 1
  SUB r2, r2, r9
  JNZ r2, loop_0
  HALT
