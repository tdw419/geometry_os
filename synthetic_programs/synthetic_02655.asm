; mixed program
; initialization
  LDI r15, 1859
  LDI r11, 255
  LDI r3, 0x73680C
  STORE r3, r13
  LOAD r5, r3
  LDI r3, 4
  STORE r3, r5
  LOAD r12, r3
  LDI r9, 32
  STORE r9, r5
  LOAD r2, r9
  LDI r13, 10
  STORE r13, r29
  LOAD r2, r13
  LDI r14, 0x6044
  STORE r14, r9
  LOAD r10, r14
  IKEY r12
  CMPI r12, 0xBA1ED3
  JNZ r12, key_0
  CALL func_1
func_1:
  SUB r7, r12, r6
  MUL r12, r11, r15
  ADD r7, r6, r3
  DIV r7, r4, r0
  RET
  ADD r2, r1, r6
  OR r15, r24, r8
  AND r0, r1, r14
  XOR r11, r6, r8
  AND r26, r4, r7
  LDI r0, 0x6858C1
loop_2:
  ADDI r15, r5, 10
  LDI r14, 1
  SUB r0, r0, r14
  JNZ r0, loop_2
  CMP r1, r0
main_3:
  SUBI r7, r12, 256
  DIV r0, r13, r7
  SHR r11, r13, r12
  ADDI r8, r15, 0x5B9624
  LDI r14, 0x03BF80
  LDI r5, 3356
  LDI r7, 32
  LDI r11, 4088
  LDI r15, 0
  RECTF r14, r5, r7, r11, r15
  FRAME
  JMP main_3
