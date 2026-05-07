; mixed program
; initialization
  LDI r21, 3278
  LDI r0, 0x7CCDEE
  IKEY r1
  CMPI r1, 0xF65949
  JNZ r1, key_0
  DIV r9, r7, r3
  LDI r15, 0x71D67F
  LDI r15, 165
  LDI r8, 255
  PSET r15, r15, r8
  PUSH r4
  PUSH r6
  PUSH r20
  DIV r7, r8, r11
  AND r6, r8, r24
  AND r14, r4, r12
  POP r20
  POP r6
  POP r4
  IKEY r10
  CMPI r10, 245
  JNZ r10, key_1
  CMP r2, r9
  JNZ r2, else_2
  ADD r13, r15, r8
  DIV r12, r7, r10
  MOD r10, r1, r7
  MUL r15, r12, r7
  JMP endif_3
else_2:
  LDI r4, 0
  FILL r4
endif_3:
  CALL func_4
func_4:
  XOR r7, r10, r12
  OR r8, r2, r12
  SHL r3, r4, r5
  MUL r6, r10, r7
  RET
  LDI r12, 0
loop_5:
  MUL r4, r14, r2
  ANDI r12, r1, 238
  SUBI r2, r0, 16
  LDI r11, 1
  SUB r12, r12, r11
  JNZ r12, loop_5
main_6:
  LDI r29, 0xE1D87B
  LDI r2, 1
  LDI r0, 0x6788F7
  PSETI
  OR r7, r14, r10
  XOR r11, r8, r3
  XOR r10, r3, r1
  XOR r12, r14, r4
  OR r1, r8, r0
  XOR r10, r1, r5
  AND r11, r15, r2
  OR r7, r10, r8
  OR r3, r9, r2
  AND r4, r9, r15
  IKEY r7
  CMPI r7, 0xD8CBFB
  JNZ r7, key_7
  FRAME
  JMP main_6
