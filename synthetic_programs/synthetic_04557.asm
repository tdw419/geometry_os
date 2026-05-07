; math computation
; initialization
  LDI r7, 0xF9BE01
  LDI r5, 3913
  LDI r0, 0x050937
  LDI r12, 0x26FFD6
  LDI r14, 2
  LDI r11, 0x6FBAD0
  LDI r9, 256
  XOR r3, r2, r1
  XOR r9, r0, r2
  XOR r8, r11, r14
  XOR r2, r14, r0
  SUBI r15, r14, 0xBCE01C
  OR r7, r2, r14
  AND r0, r22, r8
  SUBI r10, r6, 0x00F426
  SUBI r4, r9, 93
  SHR r9, r10, r2
  SHLI r11, r9, 2
  SAR r8, r14, r2
  ADD r2, r5, r6
  ADDI r10, r1, 32
  XOR r12, r7, r10
  XOR r6, r5, r0
  XOR r2, r6, r26
  SHL r3, r6, r14
  SHL r9, r8, r26
  SAR r15, r4, r0
  DIV r11, r5, r9
  SHL r14, r3, r13
  CMPI r11, r0, 255
  HALT
