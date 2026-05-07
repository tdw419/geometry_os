; mixed program
; initialization
  LDI r11, 0xE7E08F
  LDI r5, 3682
  LDI r3, 32
  LDI r15, 0x15E99D
  LDI r12, 41
  LDI r1, 188
  SHR r12, r6, r14
  CMP r7, r4
  JZ r7, else_0
  XOR r8, r4, r7
  MUL r2, r14, r10
  SUB r7, r21, r0
  JMP endif_1
else_0:
  LDI r6, 0x4484C3
  LDI r3, 0x2BDD08
  LDI r12, 64
  PSET r6, r3, r12
  LDI r1, 256
  LDI r7, 3650
  LDI r5, 255
  LDI r11, 2191
  LDI r7, 0xEF42D7
  LINE r1, r7, r5, r11, r7
  LDI r6, 778
  LDI r6, 3490
  LDI r8, 0xE1ECB5
  PSET r6, r6, r8
  LDI r8, 128
  FILL r8
endif_1:
  LDI r5, 601
  LDI r15, 4
  LDI r11, 601
  LDI r10, 572
  LDI r10, 2
  RECTF r5, r15, r11, r10, r10
  LDI r4, 0x7FCFF4
  LDI r11, 1
  LDI r11, 1303
  WPIXEL
  CMPI r6, 157
  SHL r13, r4, r14
  SHL r11, r30, r14
  SHLI r14, r19, 0xA116AE
  SHLI r0, r2, 1
  HALT
