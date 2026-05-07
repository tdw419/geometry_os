; math computation
; initialization
  LDI r26, 0xA5FA0A
  LDI r11, 2
  SUB r2, r4, r14
  SHL r4, r26, r17
  SHLI r4, r1, 4
  SAR r5, r1, r7
  SHL r14, r8, r5
  SAR r15, r10, r13
  SHR r10, r8, r9
  XOR r7, r8, r9
  OR r13, r11, r8
  OR r10, r1, r6
  AND r15, r4, r16
  OR r15, r9, r14
  SUBI r5, r15, 0x91587C
  ADDI r0, r7, 32
  HALT
