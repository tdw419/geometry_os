; mixed program
; initialization
  LDI r5, 785
  LDI r9, 0
  LDI r0, 0xFEFC5A
  LDI r4, 1657
  LDI r13, 2496
  CMP r11, r10
  LDI r8, 0xD8F135
  LDI r9, 184
  LDI r8, 0x9B791E
  TEXT r8, r9, r8, "HELLO"
  CALL func_0
func_0:
  SHL r14, r2, r13
  AND r15, r2, r13
  SUB r0, r7, r15
  SHR r2, r9, r15
  RET
  CMP r30, r14
  JNZ r30, else_1
  SHL r13, r15, r2
  AND r7, r13, r14
  SHL r15, r6, r9
  MOD r1, r12, r5
  JMP endif_2
else_1:
  LDI r13, 32
  LDI r7, 0x5B0023
  LDI r6, 128
  LDI r5, 64
  LDI r4, 32
  LINE r13, r7, r6, r5, r4
  LDI r14, 0xEAD62F
  LDI r11, 2471
  LDI r14, 2
  LDI r6, 2093
  LDI r9, 0xC38312
  LINE r14, r11, r14, r6, r9
  LDI r15, 0
  LDI r12, 10
  LDI r1, 0xA7D342
  PSET r15, r12, r1
  LDI r12, 1493
  LDI r4, 151
  LDI r11, 3918
  PSET r12, r4, r11
endif_2:
  IKEY r3
  CMPI r3, 0x4563EE
  JNZ r3, key_3
  HALT
