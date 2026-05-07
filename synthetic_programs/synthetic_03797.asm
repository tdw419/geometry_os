; mixed program
; initialization
  LDI r6, 3169
  LDI r3, 0x727AFD
  LDI r10, 1051
  CMP r7, r12
  JZ r7, else_0
  MUL r13, r3, r8
  DIV r4, r7, r11
  MOD r5, r0, r2
  JMP endif_1
else_0:
  LDI r2, 255
  LDI r1, 1
  LDI r14, 16
  WPIXEL
endif_1:
  CMP r6, r3
  IKEY r1
  CMPI r1, 16
  JNZ r1, key_2
  LDI r1, 3589
  STORE r1, r13
  LOAD r19, r1
  LDI r0, 0
  STORE r0, r13
  LOAD r7, r0
  HALT
