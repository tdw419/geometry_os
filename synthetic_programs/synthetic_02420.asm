; drawing loop program
; initialization
  LDI r1, 0xADBC3B
  LDI r8, 4
  LDI r7, 0xE707E4
  LDI r2, 1
  LDI r15, 255
main_0:
  SHR r14, r11, r4
  SAR r5, r8, r12
  AND r8, r14, r1
  CMPI r4, 1
  CMPI r1, r13, 146
  SHR r7, r15, r11
  SAR r3, r14, r9
  SAR r8, r6, r4
  SHL r15, r1, r10
  FRAME
  JMP main_0
