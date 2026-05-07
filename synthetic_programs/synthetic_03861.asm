; math computation
; initialization
  LDI r0, 8
  LDI r12, 255
  AND r0, r2, r11
  XOR r6, r4, r12
  SHR r4, r1, r6
  SHR r0, r5, r12
  SAR r9, r13, r14
  SHR r12, r17, r8
  SHLI r8, r10, 6
  SHL r31, r2, r10
  SHLI r29, r12, 0x5F3BB5
  SHR r5, r7, r14
  SUB r7, r14, r0
  ADD r14, r13, r2
  DIV r6, r15, r8
  SHL r14, r4, r2
  SHR r5, r12, r4
  SHL r15, r8, r10
  SAR r4, r8, r21
  SHR r3, r1, r0
  ADDI r1, r15, 256
  CMPI r1, r8, 0x9073C3
  ANDI r17, r2, 0
  SHR r14, r11, r4
  SUBI r9, r12, 64
  SUB r2, r7, r31
  HALT
