; math computation
; initialization
  LDI r10, 0xABC3DC
  LDI r29, 3105
  SHLI r8, r5, 32
  SHLI r9, r11, 255
  OR r0, r3, r11
  SHR r2, r15, r7
  SHR r11, r1, r8
  SAR r4, r9, r11
  SAR r5, r15, r3
  CMPI r0, r5, 0x3924FB
  AND r11, r2, r14
  SHLI r4, r13, 128
  SAR r5, r6, r11
  SAR r12, r8, r4
  SAR r12, r13, r10
  ANDI r2, r11, 0
  OR r5, r14, r8
  OR r5, r26, r6
  AND r13, r10, r6
  OR r4, r13, r7
  SHLI r20, r11, 10
  SHLI r14, r2, 64
  SHR r3, r15, r4
  OR r15, r14, r1
  CMPI r12, r15, 0xD12893
  MUL r8, r4, r0
  MUL r11, r14, r1
  SAR r6, r8, r1
  SHLI r11, r15, 1
  SAR r0, r14, r1
  SAR r5, r9, r13
  OR r28, r11, r5
  XOR r6, r15, r28
  XOR r11, r9, r2
  AND r10, r12, r8
  SUB r5, r13, r0
  CMPI r2, r5, 0x0DD250
  ANDI r15, r6, 10
  HALT
