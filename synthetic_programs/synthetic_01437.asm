; mixed program
; initialization
  LDI r1, 64
  LDI r14, 128
  LDI r11, 0x9F4320
  LDI r10, 0x456DDC
  LDI r8, 1
  LDI r9, 33
  LDI r0, 0x918C73
  OR r5, r1, r15
  AND r12, r5, r15
  CALL func_0
func_0:
  SUB r11, r2, r3
  OR r9, r28, r2
  MUL r9, r1, r10
  MOD r15, r1, r26
  RET
  CMP r4, r6
  PUSH r0
  DIV r2, r15, r8
  MUL r5, r2, r1
  POP r0
  MUL r12, r3, r8
  SHLI r6, r14, 0x9F4D5E
  SHR r15, r5, r3
  SHL r6, r10, r3
  SHL r11, r0, r9
main_1:
  IKEY r11
  CMPI r11, 207
  JNZ r11, key_2
  LDI r7, 1150
  LDI r2, 881
  LDI r6, 10
  TEXT r7, r2, r6, "HELLO"
  CMPI r11, r9, 136
  CMPI r5, 246
  FRAME
  JMP main_1
