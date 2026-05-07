; drawing loop program
; initialization
  LDI r2, 255
  LDI r15, 0x3EE74D
  LDI r7, 0xE13121
  LDI r9, 16
  LDI r1, 1187
  LDI r8, 255
  LDI r0, 1134
  LDI r14, 4019
main_0:
  LDI r1, 10
  LDI r2, 10
  LDI r15, 0x6D17E5
  LDI r3, 0
  CIRCLE r1, r2, r15, r3
  CMPI r15, 0x698C37
  SHLI r0, r15, 256
  SHR r1, r10, r8
  SHL r7, r0, r6
  SUB r21, r10, r15
  LDI r15, 1838
  FILL r15
  FRAME
  JMP main_0
