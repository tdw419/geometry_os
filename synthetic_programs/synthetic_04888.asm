; drawing loop program
; initialization
  LDI r5, 64
  LDI r12, 0xB32ADC
  LDI r14, 0xD96C82
  LDI r13, 16
  LDI r4, 0x195D03
  LDI r3, 4
  LDI r6, 0x76DE62
main_0:
  OR r7, r15, r18
  OR r8, r2, r4
  XOR r6, r7, r4
  MUL r12, r10, r13
  SHR r5, r13, r2
  SAR r7, r10, r13
  FRAME
  JMP main_0
