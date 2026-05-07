; mixed program
; initialization
  LDI r4, 128
  LDI r8, 0xC5E347
  LDI r5, 8
  LDI r7, 0x7ED46F
  LDI r15, 629
  MOD r2, r1, r4
  LDI r3, 16
  LDI r1, 0x108744
  LDI r1, 0x74B48D
  PSET r3, r1, r1
  CMP r4, r12
  JNZ r4, else_0
  SHR r12, r15, r13
  JMP endif_1
else_0:
  LDI r3, 0x768B1F
  LDI r15, 4
  LDI r15, 0x1EBB66
  LDI r7, 18
  LDI r5, 256
  RECTF r3, r15, r15, r7, r5
  LDI r30, 1
  LDI r13, 1464
  LDI r8, 64
  PSET r30, r13, r8
  LDI r4, 10
  LDI r13, 0xF2E60F
  LDI r6, 484
  LDI r15, 3980
  LDI r12, 2473
  LINE r4, r13, r6, r15, r12
  LDI r5, 352
  LDI r2, 10
  LDI r3, 0x657019
  PSETI
endif_1:
  SAR r10, r0, r2
  SHLI r9, r10, 0
  OR r4, r11, r10
  XOR r14, r7, r3
  XOR r11, r3, r14
  LDI r6, 0xA65662
  LDI r27, 256
  LDI r15, 1986
  TEXT r6, r27, r15, "HELLO"
  CALL func_2
func_2:
  OR r11, r1, r12
  MUL r2, r1, r6
  XOR r12, r11, r8
  SHR r9, r19, r1
  SUB r13, r2, r11
  SUB r12, r15, r10
  RET
  LDI r7, 256
  LDI r7, 0xDDEF3B
  LDI r2, 0xBD5308
  PSET r7, r7, r2
main_3:
  SHL r24, r4, r11
  SHL r14, r13, r4
  SHLI r13, r7, 5
  XOR r7, r14, r9
  XOR r1, r11, r5
  AND r5, r4, r14
  OR r7, r15, r11
  XOR r14, r2, r11
  XOR r2, r0, r6
  XOR r4, r13, r10
  AND r3, r1, r4
  XOR r6, r12, r8
  FRAME
  JMP main_3
