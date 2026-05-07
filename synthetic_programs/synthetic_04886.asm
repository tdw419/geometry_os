; mixed program
; initialization
  LDI r10, 256
  LDI r0, 0x5CA13F
  LDI r2, 0x99ABAB
  LDI r5, 0xD94960
  LDI r15, 429
  LDI r4, 2745
  LDI r28, 256
  SHLI r3, r11, 0xC4783E
  SHLI r12, r5, 0
  SAR r5, r3, r14
  CMPI r14, 4
  ADD r1, r9, r14
  LDI r0, 8
loop_0:
  LDI r12, 3133
  LDI r4, 0xEE5478
  LDI r4, 1
  PSETI
  ANDI r0, r5, 0xA10058
  ANDI r6, r10, 0
  LDI r1, 1677
  LDI r12, 0x6EAD2E
  LDI r13, 0xDBF14A
  LDI r9, 2681
  CIRCLE r1, r12, r13, r9
  LDI r12, 1
  SUB r0, r0, r12
  JNZ r0, loop_0
  AND r15, r10, r12
  AND r15, r13, r10
  XOR r11, r4, r7
  OR r13, r10, r8
  XOR r15, r4, r0
  XOR r12, r4, r22
  OR r0, r5, r13
  HALT
