; math computation
; initialization
  LDI r9, 8
  LDI r5, 16
  LDI r7, 4
  ADDI r9, r3, 8
  DIV r14, r7, r10
  XOR r14, r9, r7
  SHLI r8, r4, 0x71978C
  SHL r10, r8, r11
  DIV r7, r14, r11
  SHR r4, r21, r26
  SHLI r9, r8, 128
  SHLI r8, r15, 256
  MUL r11, r25, r14
  XOR r15, r8, r2
  XOR r5, r13, r14
  MOD r11, r7, r15
  SHL r2, r5, r0
  SHL r11, r3, r8
  ADDI r0, r3, 4
  SHLI r0, r15, 1
  SHLI r15, r1, 7
  AND r15, r0, r12
  OR r11, r12, r1
  XOR r7, r0, r9
  AND r0, r10, r9
  OR r10, r0, r22
  HALT
