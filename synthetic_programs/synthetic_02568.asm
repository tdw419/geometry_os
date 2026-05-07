; mixed program
; initialization
  LDI r10, 0xFD249B
  LDI r4, 0xCF5B7D
  LDI r13, 1376
  LDI r6, 8
; palette
  LDI r12, 0x6056
  LDI r7, 1
  LDI r9, 0x000000
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0xFF8800
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0xAA00AA
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0x008888
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0x000066
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0xFFAA00
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0x00FF00
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0xFFAA00
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0xFF8800
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0x000000
  STORE r12, r9
  ADD r12, r12, r7
  LDI r9, 0xFF8800
  STORE r12, r9
  ADD r12, r12, r7
  PUSH r6
  AND r1, r13, r14
  DIV r12, r13, r8
  ADD r8, r7, r4
  SUB r22, r11, r13
  POP r6
  PUSH r15
  PUSH r8
  PUSH r6
  SHR r8, r11, r21
  OR r10, r3, r0
  AND r4, r0, r11
  DIV r14, r8, r5
  POP r6
  POP r8
  POP r15
  LDI r12, 32
loop_0:
  AND r9, r0, r8
  SHL r15, r12, r5
  CMPI r28, r7, 0xC9E011
  LDI r3, 4
  FILL r3
  LDI r5, 1
  SUB r12, r12, r5
  JNZ r12, loop_0
  LDI r10, 914
  STORE r10, r9
  LOAD r12, r10
  LDI r0, 255
  STORE r0, r1
  LOAD r3, r0
  LDI r2, 3616
  STORE r2, r0
  LOAD r14, r2
  IKEY r15
  CMPI r15, 255
  JNZ r15, key_1
  CALL func_2
func_2:
  OR r9, r2, r8
  MOD r3, r13, r11
  RET
  HALT
