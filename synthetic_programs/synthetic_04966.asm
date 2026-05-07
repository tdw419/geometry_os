; drawing loop program
; initialization
  LDI r1, 32
  LDI r12, 128
  LDI r2, 1
  LDI r6, 2
main_0:
  SHLI r13, r15, 0xB13ACB
  SAR r13, r9, r4
  SHR r7, r9, r13
  SHLI r4, r0, 0xB877BC
  CMPI r7, 213
  ADDI r15, r5, 0
  FRAME
  JMP main_0
