; drawing loop program
; initialization
  LDI r27, 0x8198D3
  LDI r5, 1
  LDI r17, 0xB4ED46
main_0:
  SAR r5, r14, r1
  SHR r4, r14, r13
  LDI r5, 2622
  LDI r2, 2537
  LDI r6, 3853
  PSETI
  FRAME
  JMP main_0
