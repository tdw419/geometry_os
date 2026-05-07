; drawing loop program
; initialization
  LDI r0, 3534
  LDI r11, 3514
  LDI r15, 128
  LDI r3, 4
  LDI r2, 0xD13A24
  LDI r12, 2587
  LDI r8, 0xD8DD0F
main_0:
  SHLI r13, r15, 0xF7AF69
  SAR r27, r12, r3
  SHR r5, r12, r1
  SHR r0, r4, r13
  SUB r11, r1, r12
  SHL r5, r14, r9
  SHR r7, r1, r0
  SHR r8, r11, r12
  SHR r2, r9, r11
  AND r6, r12, r8
  AND r3, r9, r8
  XOR r8, r12, r7
  XOR r0, r8, r7
  XOR r10, r11, r0
  XOR r7, r12, r10
  OR r15, r6, r8
  FRAME
  JMP main_0
