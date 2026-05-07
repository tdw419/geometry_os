; mixed program
; initialization
  LDI r2, 2
  LDI r6, 0x07BD26
  LDI r9, 2980
  LDI r9, 310
  FILL r9
  IKEY r0
  CMPI r0, 0xA756BF
  JNZ r0, key_0
  PUSH r9
  PUSH r8
  PUSH r14
  AND r5, r12, r9
  SUB r2, r14, r3
  SHL r11, r12, r21
  XOR r9, r23, r2
  POP r14
  POP r8
  POP r9
  CALL func_1
func_1:
  SHL r14, r9, r3
  AND r7, r13, r11
  DIV r13, r3, r15
  SHR r2, r14, r9
  AND r5, r24, r1
  RET
  SHR r3, r5, r6
main_2:
  LDI r6, 0x55BDA6
  LDI r14, 2
  LDI r6, 0xC203D6
  DRAWTEXT r6, r14, r6, "WORLD"
  IKEY r3
  CMPI r3, 6
  JNZ r3, key_3
  IKEY r13
  CMPI r13, 129
  JNZ r13, key_4
  LDI r7, 43
  LDI r5, 2407
  LDI r5, 0xBF9F42
  DRAWTEXT r7, r5, r5, "WORLD"
  IKEY r5
  CMPI r5, 184
  JNZ r5, key_5
  FRAME
  JMP main_2
