; mixed program
; initialization
  LDI r15, 2544
  LDI r3, 255
  LDI r10, 2
  LDI r11, 996
  LDI r7, 32
loop_0:
  LDI r9, 1
  FILL r9
  CMPI r0, r6, 0xC1071F
  LDI r4, 2149
  LDI r5, 238
  LDI r10, 2
  PSETI
  ANDI r3, r15, 157
  LDI r11, 1
  SUB r7, r7, r11
  JNZ r7, loop_0
  SHR r3, r6, r15
  SHL r1, r6, r3
  SHR r12, r5, r4
  SHL r7, r27, r30
  CALL func_1
func_1:
  SUB r13, r8, r11
  OR r5, r11, r10
  SHL r5, r14, r1
  MUL r9, r10, r1
  RET
  LDI r14, 906
  STORE r14, r11
  LOAD r7, r14
  LDI r13, 0
  STORE r13, r11
  LOAD r27, r13
  LDI r15, 128
  STORE r15, r11
  LOAD r12, r15
  LDI r9, 255
  STORE r9, r29
  LOAD r1, r9
  CMP r3, r10
  LDI r0, 546
  LDI r13, 2
  LDI r15, 2
  TEXT r0, r13, r15, "HELLO"
  SHL r9, r11, r5
  SHLI r7, r15, 0x89D9B8
  HALT
