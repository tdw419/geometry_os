; conditional logic
; initialization
  LDI r10, 4
  LDI r12, 2192
  LDI r15, 64
  LDI r5, 0x192303
  LDI r6, 128
  CMP r4, r6
  JNZ r4, else_0
  AND r7, r0, r6
  SHR r5, r1, r6
  JMP endif_1
else_0:
  LDI r3, 0
  LDI r9, 0x6792C7
  LDI r5, 0x3CBDD0
  PSET r3, r9, r5
  LDI r14, 4
  LDI r3, 4016
  LDI r27, 0x40F7A0
  WPIXEL
  LDI r14, 8
  LDI r9, 1253
  LDI r8, 1
  LDI r7, 984
  CIRCLE r14, r9, r8, r7
  LDI r1, 32
  LDI r6, 0xBD98F2
  LDI r14, 8
  PSETI
endif_1:
  HALT
