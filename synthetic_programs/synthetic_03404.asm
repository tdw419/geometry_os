; math computation
; initialization
  LDI r3, 604
  LDI r11, 2925
  LDI r9, 1875
  LDI r13, 2749
  LDI r7, 2
  LDI r5, 4
  AND r6, r14, r0
  OR r6, r11, r0
  OR r1, r13, r6
  SHL r11, r13, r3
  SHL r6, r13, r7
  ANDI r3, r0, 0x455734
  SHR r7, r9, r12
  SHR r3, r12, r18
  SUBI r3, r0, 64
  SHLI r0, r10, 8
  SAR r8, r1, r4
  OR r8, r3, r12
  XOR r10, r14, r6
  SHLI r2, r5, 10
  SAR r4, r16, r9
  SHLI r9, r0, 4
  SHR r12, r10, r13
  SUB r2, r13, r5
  ANDI r13, r10, 254
  ADDI r17, r14, 65
  HALT
