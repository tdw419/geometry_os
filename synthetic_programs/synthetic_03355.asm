; mixed program
; initialization
  LDI r2, 0x97DD31
  LDI r4, 10
  LDI r11, 0xD0B1EA
  LDI r20, 2257
  LDI r10, 32
  LDI r12, 0x502D74
  LDI r1, 2
  LDI r14, 64
; palette
  LDI r2, 0x70A3
  LDI r12, 1
  LDI r15, 0x550077
  STORE r2, r15
  ADD r2, r2, r12
  LDI r15, 0xAA00AA
  STORE r2, r15
  ADD r2, r2, r12
  LDI r15, 0xFF00FF
  STORE r2, r15
  ADD r2, r2, r12
  LDI r15, 0xFF8800
  STORE r2, r15
  ADD r2, r2, r12
  LDI r15, 0xFFFFFF
  STORE r2, r15
  ADD r2, r2, r12
  LDI r15, 0x880088
  STORE r2, r15
  ADD r2, r2, r12
  LDI r15, 0x880088
  STORE r2, r15
  ADD r2, r2, r12
  CALL func_0
func_0:
  SHR r12, r23, r15
  DIV r0, r13, r14
  RET
  CMP r0, r9
  JZ r0, else_1
  OR r10, r9, r12
  XOR r9, r5, r11
  MOD r0, r11, r28
  JMP endif_2
else_1:
  LDI r1, 1689
  LDI r14, 8
  LDI r8, 0x6633C5
  PSETI
  LDI r14, 1328
  LDI r4, 2510
  LDI r1, 0x2530CC
  WPIXEL
  LDI r9, 1
  LDI r8, 3392
  LDI r10, 972
  WPIXEL
  LDI r2, 0x084F31
  LDI r6, 157
  LDI r2, 0xAE4E52
  PSET r2, r6, r2
endif_2:
  CALL func_3
func_3:
  AND r4, r5, r6
  SHR r9, r0, r8
  ADD r4, r0, r13
  RET
  PUSH r13
  PUSH r7
  PUSH r6
  PUSH r6
  DIV r4, r6, r8
  AND r17, r6, r7
  SHR r8, r4, r6
  DIV r11, r12, r15
  OR r2, r1, r6
  POP r6
  POP r6
  POP r7
  POP r13
  IKEY r11
  CMPI r11, 0
  JNZ r11, key_4
  LDI r1, 8
  LDI r8, 128
  LDI r5, 10
  PSETI
  OR r3, r9, r1
  AND r0, r15, r4
main_5:
  LDI r12, 4
  LDI r12, 255
  LDI r3, 3331
  DRAWTEXT r12, r12, r3, "WORLD"
  OR r6, r11, r27
  OR r7, r5, r15
  AND r9, r14, r5
  CMPI r28, r13, 16
  CMP r0, r13
  FRAME
  JMP main_5
