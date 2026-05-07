; mixed program
; initialization
  LDI r5, 0x5E47A7
  LDI r15, 0xF3DB5F
  LDI r3, 631
  LDI r2, 928
  LDI r14, 0x81EB2F
  LDI r4, 0xC9866D
  LDI r12, 16
  LDI r1, 0x738EDA
  CMP r7, r1
  JNZ r7, else_0
  AND r8, r12, r21
  XOR r8, r14, r12
  XOR r13, r14, r2
  AND r0, r9, r15
  JMP endif_1
else_0:
  LDI r2, 10
  LDI r11, 0xFBAC02
  LDI r3, 64
  PSETI
endif_1:
  LDI r5, 38
loop_2:
  ADDI r9, r2, 0xB2E2A1
  SUBI r17, r2, 64
  ANDI r13, r0, 64
  LDI r20, 1
  SUB r5, r5, r20
  JNZ r5, loop_2
  SHR r9, r14, r1
  SHLI r9, r6, 0x8502EB
  IKEY r14
  CMPI r14, 172
  JNZ r14, key_3
  CALL func_4
func_4:
  SUB r8, r9, r3
  OR r2, r10, r8
  OR r3, r9, r7
  MUL r9, r3, r4
  RET
  XOR r14, r1, r2
  XOR r15, r2, r3
  AND r6, r1, r8
  XOR r15, r3, r11
  CALL func_5
func_5:
  SHL r3, r15, r7
  SUB r13, r1, r2
  RET
  HALT
