; drawing loop program
; initialization
  LDI r4, 0x880187
  LDI r5, 0xF2AB63
main_0:
  OR r4, r2, r5
  OR r5, r13, r1
  XOR r17, r12, r14
  SAR r7, r10, r13
  SHLI r12, r13, 0x778B81
  SHLI r7, r29, 0x56F6B9
  FRAME
  JMP main_0
