; math computation
; initialization
  LDI r2, 128
  LDI r15, 1706
  SHL r5, r12, r15
  SHR r12, r15, r0
  OR r5, r8, r3
  AND r21, r7, r16
  OR r8, r0, r4
  AND r3, r26, r12
  XOR r11, r3, r6
  XOR r1, r6, r10
  XOR r11, r15, r12
  AND r13, r8, r5
  ADDI r13, r0, 1
  SHLI r4, r12, 2
  SHL r14, r3, r7
  AND r1, r0, r10
  SUBI r12, r8, 128
  ADDI r4, r10, 0x0D45CF
  ADD r11, r9, r1
  AND r8, r11, r0
  SHL r3, r5, r9
  SHR r11, r12, r8
  DIV r14, r3, r9
  CMPI r10, r0, 64
  MOD r14, r4, r10
  SUBI r5, r13, 0xF484BB
  ADDI r9, r7, 255
  ANDI r11, r9, 8
  SHL r13, r4, r5
  SHLI r24, r4, 4
  HALT
