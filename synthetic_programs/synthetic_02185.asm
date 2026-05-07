; drawing loop program
; initialization
  LDI r2, 0xBB8130
  LDI r4, 0x32030F
main_0:
  LDI r1, 399
  LDI r9, 1729
  LDI r5, 0x14F123
  DRAWTEXT r1, r9, r5, "WORLD"
  SAR r1, r13, r6
  SHL r7, r10, r1
  LDI r9, 1403
  LDI r5, 1871
  LDI r9, 4
  DRAWTEXT r9, r5, r9, "WORLD"
  LDI r14, 2
  LDI r7, 703
  LDI r1, 0xE822AF
  LDI r10, 128
  CIRCLE r14, r7, r1, r10
  FRAME
  JMP main_0
