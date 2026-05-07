; drawing loop program
; initialization
  LDI r12, 0x95167A
  LDI r13, 1083
  LDI r4, 97
  LDI r11, 3976
  LDI r5, 3462
main_0:
  CMP r2, r30
  AND r23, r5, r14
  AND r12, r14, r8
  OR r15, r13, r14
  OR r9, r15, r1
  AND r10, r2, r5
  CMPI r7, r11, 0x195DFF
  SHR r4, r13, r3
  SHLI r16, r7, 0x6BEE38
  SHLI r2, r13, 16
  SHLI r12, r11, 256
  FRAME
  JMP main_0
