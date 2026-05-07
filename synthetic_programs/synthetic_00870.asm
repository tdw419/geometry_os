; math computation
; initialization
  LDI r2, 0x1C14A0
  LDI r14, 256
  MOD r0, r15, r3
  SHL r5, r10, r13
  MOD r4, r15, r8
  SUBI r0, r3, 0xD995AD
  XOR r2, r13, r0
  XOR r14, r5, r2
  SHR r1, r0, r9
  SHR r13, r11, r12
  SHR r1, r5, r11
  CMPI r13, r11, 256
  XOR r9, r15, r11
  OR r1, r2, r10
  AND r0, r6, r3
  ADDI r12, r1, 0x6413E6
  HALT
