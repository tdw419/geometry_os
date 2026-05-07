; mixed program
; initialization
  LDI r1, 0x2F497C
  LDI r6, 0xA8E9AA
  LDI r12, 0x318053
  LDI r13, 2332
  LDI r9, 1076
  LDI r10, 1054
  LDI r3, 820
  LDI r2, 10
  IKEY r4
  CMPI r4, 4
  JNZ r4, key_0
  PUSH r13
  PUSH r4
  ADD r10, r0, r7
  DIV r2, r0, r11
  SHR r15, r1, r2
  POP r4
  POP r13
  SAR r11, r2, r5
  SHR r1, r15, r5
  SHL r11, r7, r14
  SHL r9, r0, r4
  SHL r5, r0, r6
  LDI r31, 822
  LDI r5, 633
  LDI r1, 0x85D6ED
  DRAWTEXT r31, r5, r1, "WORLD"
  CMP r3, r5
  LDI r15, 16
  STORE r15, r1
  LOAD r9, r15
  LDI r5, 3388
  STORE r5, r12
  LOAD r9, r5
  LDI r7, 1782
  STORE r7, r8
  LOAD r11, r7
  LDI r15, 16
  STORE r15, r20
  LOAD r0, r15
  LDI r3, 0xAB9444
  STORE r3, r9
  LOAD r11, r3
  CMP r3, r10
  JNZ r3, else_1
  SUB r8, r2, r3
  XOR r3, r1, r0
  AND r10, r7, r8
  JMP endif_2
else_1:
  LDI r0, 3440
  LDI r3, 0xF3EADA
  LDI r4, 255
  PSETI
endif_2:
  HALT
