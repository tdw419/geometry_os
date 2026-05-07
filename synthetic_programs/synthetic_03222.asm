; mixed program
; initialization
  LDI r1, 4058
  LDI r3, 128
  LDI r9, 0xAD73E6
  IKEY r7
  CMPI r7, 63
  JNZ r7, key_0
  MUL r3, r2, r14
  CALL func_1
func_1:
  DIV r1, r14, r9
  SHR r2, r3, r15
  DIV r0, r8, r11
  RET
  LDI r8, 255
  STORE r8, r10
  LOAD r4, r8
  LDI r3, 0xA53539
  STORE r3, r3
  LOAD r9, r3
  LDI r4, 255
  STORE r4, r11
  LOAD r8, r4
  LDI r7, 0x628873
  STORE r7, r5
  LOAD r15, r7
  XOR r2, r3, r11
  XOR r0, r6, r13
  LDI r3, 16
  LDI r7, 0x41B004
  LDI r9, 0x999D17
  TEXT r3, r7, r9, "HELLO"
  SUB r2, r15, r0
  LDI r2, 64
  LDI r14, 16
  LDI r14, 1
  LDI r11, 0
  LDI r6, 1392
  LINE r2, r14, r14, r11, r6
main_2:
  LDI r14, 3250
  LDI r13, 0x5622C9
  LDI r0, 0x89BEBA
  PSETI
  IKEY r2
  CMPI r2, 8
  JNZ r2, key_3
  FRAME
  JMP main_2
