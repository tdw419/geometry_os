; mixed program
; initialization
  LDI r2, 1
  LDI r0, 0x59E9E8
  LDI r0, 28
loop_0:
  ADD r15, r13, r1
  MUL r5, r12, r14
  ADDI r1, r7, 255
  DIV r4, r10, r2
  LDI r15, 1
  SUB r0, r0, r15
  JNZ r0, loop_0
  PUSH r13
  PUSH r3
  DIV r13, r4, r12
  SHL r11, r3, r27
  SHL r28, r10, r11
  MUL r8, r10, r1
  AND r9, r5, r2
  POP r3
  POP r13
  CALL func_1
func_1:
  SHL r12, r6, r7
  SUB r3, r11, r14
  ADD r7, r13, r11
  MUL r1, r2, r9
  SHL r4, r11, r13
  MUL r10, r2, r9
  RET
  CMP r12, r14
  JNZ r12, else_2
  OR r12, r10, r14
  SHR r15, r3, r14
  AND r7, r3, r9
  SHR r1, r30, r23
  JMP endif_3
else_2:
  LDI r3, 305
  LDI r17, 0x581BF9
  LDI r8, 0x492D27
  PSETI
  LDI r14, 0x57DE0A
  LDI r7, 0
  LDI r12, 10
  LDI r5, 0x089F00
  LDI r12, 0xD5272D
  LINE r14, r7, r12, r5, r12
endif_3:
  OR r11, r6, r15
  AND r0, r10, r7
  OR r13, r8, r4
  SAR r15, r2, r4
  SHR r13, r1, r8
  CMPI r8, 123
main_4:
  SHL r8, r6, r0
  SHL r10, r9, r14
  IKEY r14
  CMPI r14, 128
  JNZ r14, key_5
  SHR r13, r4, r5
  SHL r0, r1, r14
  SHLI r4, r3, 8
  SHL r3, r13, r15
  OR r14, r8, r7
  XOR r13, r14, r5
  OR r0, r6, r15
  LDI r6, 16
  LDI r13, 0x08FB3F
  LDI r12, 0x13CE1D
  DRAWTEXT r6, r13, r12, "WORLD"
  ADDI r11, r8, 0xB9D895
  FRAME
  JMP main_4
