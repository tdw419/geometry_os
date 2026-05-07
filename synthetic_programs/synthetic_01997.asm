; mixed program
; initialization
  LDI r5, 0xBD43EC
  LDI r11, 874
  LDI r15, 1868
  LDI r2, 0x003B1B
  LDI r6, 1235
  LDI r14, 517
  LDI r10, 2406
  LDI r14, 128
  TEXT r14, r10, r14, "HELLO"
  CALL func_0
func_0:
  MUL r13, r8, r14
  MUL r0, r13, r1
  DIV r12, r14, r2
  MOD r7, r4, r12
  SUB r3, r13, r10
  RET
  LDI r7, 0xF9204D
  STORE r7, r10
  LOAD r3, r7
  LDI r3, 2
  STORE r3, r2
  LOAD r14, r3
  LDI r5, 155
  STORE r5, r18
  LOAD r7, r5
  MUL r0, r11, r5
  LDI r0, 1143
  LDI r9, 0x690C24
  LDI r11, 0xA28383
  WPIXEL
  SHL r5, r9, r3
  SHLI r22, r2, 8
  IKEY r7
  CMPI r7, 228
  JNZ r7, key_1
  SHL r8, r1, r5
  SHR r3, r4, r8
  HALT
