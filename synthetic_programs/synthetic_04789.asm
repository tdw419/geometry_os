; mixed program
; initialization
  LDI r11, 1
  LDI r15, 0xD1C6A8
  LDI r7, 32
  LDI r12, 0x18AD73
  LDI r9, 1
  LDI r10, 2962
  LDI r5, 32
  LDI r4, 0x125EA3
  AND r1, r12, r13
  IKEY r6
  CMPI r6, 256
  JNZ r6, key_0
  LDI r12, 4
  FILL r12
  CALL func_1
func_1:
  DIV r0, r11, r3
  MOD r10, r6, r12
  MOD r14, r12, r9
  MOD r10, r3, r0
  RET
main_2:
  LDI r15, 64
  LDI r1, 0x196B4F
  LDI r6, 8
  LDI r3, 32
  CIRCLE r15, r1, r6, r3
  IKEY r3
  CMPI r3, 106
  JNZ r3, key_3
  IKEY r6
  CMPI r6, 0x5AF830
  JNZ r6, key_4
  SUBI r3, r6, 238
  XOR r3, r10, r5
  OR r5, r4, r0
  OR r12, r6, r8
  OR r6, r2, r13
  ANDI r5, r13, 47
  FRAME
  JMP main_2
