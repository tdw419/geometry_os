; mixed program
; initialization
  LDI r0, 0xA8B3BD
  LDI r11, 32
  LDI r7, 256
  LDI r15, 2482
  LDI r4, 0
  DRAWTEXT r7, r15, r4, "WORLD"
  LDI r4, 0xD40430
  STORE r4, r11
  LOAD r0, r4
  LDI r4, 476
  STORE r4, r8
  LOAD r7, r4
  LDI r15, 0x314D06
  STORE r15, r13
  LOAD r20, r15
  LDI r12, 1269
  STORE r12, r12
  LOAD r6, r12
  LDI r19, 10
  STORE r19, r10
  LOAD r12, r19
  CMP r30, r28
  JNZ r30, else_0
  MUL r13, r8, r10
  AND r10, r11, r5
  JMP endif_1
else_0:
  LDI r1, 2039
  LDI r11, 128
  LDI r15, 0xAC4E0C
  PSETI
  LDI r11, 0xC6EFA6
  LDI r1, 0x631F8F
  LDI r8, 64
  WPIXEL
  LDI r13, 436
  FILL r13
endif_1:
  LDI r9, 8
  LDI r9, 256
  LDI r5, 4
  DRAWTEXT r9, r9, r5, "WORLD"
  CMP r13, r6
  JZ r13, else_2
  ADD r14, r11, r15
  JMP endif_3
else_2:
  LDI r7, 4
  LDI r0, 16
  LDI r10, 2
  PSET r7, r0, r10
  LDI r11, 2140
  LDI r9, 2916
  LDI r0, 8
  PSET r11, r9, r0
  LDI r1, 2997
  LDI r12, 3336
  LDI r15, 0xD42657
  PSETI
endif_3:
  CALL func_4
func_4:
  OR r6, r8, r13
  SHL r4, r3, r9
  ADD r0, r4, r14
  SUB r15, r8, r14
  SHR r5, r11, r13
  DIV r15, r0, r11
  RET
  IKEY r12
  CMPI r12, 107
  JNZ r12, key_5
  PUSH r11
  DIV r15, r30, r6
  OR r8, r7, r13
  POP r11
main_6:
  ADDI r2, r24, 4
  XOR r6, r9, r21
  AND r7, r0, r2
  AND r10, r4, r1
  AND r7, r14, r16
  FRAME
  JMP main_6
