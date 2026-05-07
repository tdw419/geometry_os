; mixed program
; initialization
  LDI r12, 0xA46014
  LDI r13, 2219
  LDI r9, 10
  LDI r15, 0x610A10
  IKEY r9
  CMPI r9, 0xF091F8
  JNZ r9, key_0
  SHR r10, r3, r12
  SHLI r7, r8, 0x92B018
  SAR r3, r13, r5
  SHR r14, r11, r5
  LDI r14, 0x99BCCA
  LDI r2, 64
  LDI r18, 1479
  TEXT r14, r2, r18, "HELLO"
  OR r6, r7, r15
  AND r1, r8, r4
  OR r3, r7, r10
  CMP r3, r14
  JZ r3, else_1
  DIV r9, r12, r10
  JMP endif_2
else_1:
  LDI r5, 2280
  LDI r14, 64
  LDI r12, 0
  PSETI
  LDI r13, 2
  LDI r10, 2163
  LDI r14, 0x6B1599
  LDI r14, 2
  CIRCLE r13, r10, r14, r14
endif_2:
main_3:
  CMPI r6, 0x3225C4
  IKEY r15
  CMPI r15, 0x5E7E7A
  JNZ r15, key_4
  FRAME
  JMP main_3
