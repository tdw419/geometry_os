; drawing loop program
; initialization
  LDI r13, 8
  LDI r14, 4
main_0:
  ADDI r0, r8, 32
  SHLI r11, r2, 2
  SAR r3, r12, r14
  SHR r2, r0, r11
  CMPI r1, r8, 226
  CMPI r5, r10, 0xD9D679
  FRAME
  JMP main_0
