; mixed program
; initialization
  LDI r4, 104
  LDI r3, 704
  LDI r0, 2466
  LDI r14, 2840
  LDI r9, 0x538D49
  LDI r11, 1088
  LDI r16, 0x182917
  LDI r13, 3230
  LDI r9, 0
  LDI r2, 0xCD2FE7
  LDI r15, 0xBCBD79
  DRAWTEXT r9, r2, r15, "WORLD"
  PUSH r13
  XOR r4, r12, r7
  SUB r12, r26, r8
  DIV r8, r1, r4
  POP r13
  CALL func_0
func_0:
  AND r13, r15, r5
  SHL r16, r11, r5
  RET
  LDI r9, 33
loop_1:
  ANDI r15, r0, 74
  ADDI r27, r0, 206
  LDI r3, 1
  SUB r9, r9, r3
  JNZ r9, loop_1
main_2:
  ANDI r4, r13, 64
  IKEY r5
  CMPI r5, 212
  JNZ r5, key_3
  CMP r13, r0
  IKEY r21
  CMPI r21, 1
  JNZ r21, key_4
  CMPI r10, r0, 197
  FRAME
  JMP main_2
