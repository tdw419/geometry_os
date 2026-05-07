; mixed program
; initialization
  LDI r5, 3022
  LDI r0, 1068
; palette
  LDI r10, 0x2173
  LDI r4, 1
  LDI r26, 0x000066
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFFFF00
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFF8800
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFFAA00
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFFFFFF
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xAAAAAA
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xAA00AA
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFFAA00
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFF00FF
  STORE r10, r26
  ADD r10, r10, r4
  LDI r26, 0xFF8800
  STORE r10, r26
  ADD r10, r10, r4
  OR r13, r9, r11
  XOR r2, r8, r15
  OR r14, r9, r13
  XOR r9, r8, r15
  CALL func_0
func_0:
  SUB r2, r8, r14
  SUB r0, r10, r15
  RET
  IKEY r15
  CMPI r15, 216
  JNZ r15, key_1
  CMP r3, r7
  LDI r15, 64
  STORE r15, r14
  LOAD r4, r15
  LDI r11, 0x24B171
  STORE r11, r13
  LOAD r2, r11
  LDI r14, 8
  STORE r14, r31
  LOAD r13, r14
  PUSH r17
  DIV r10, r14, r3
  OR r7, r23, r15
  SHR r4, r13, r14
  POP r17
  HALT
