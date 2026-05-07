; mixed program
; initialization
  LDI r10, 0x1637AE
  LDI r4, 2326
  LDI r7, 2
  LDI r13, 1775
  LDI r8, 949
; palette
  LDI r9, 0x2116
  LDI r1, 1
  LDI r6, 0x0044FF
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0x0044FF
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0xAAFF00
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0xFFAA00
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0xFF8800
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0xAA00AA
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0x0000CC
  STORE r9, r6
  ADD r9, r9, r1
  LDI r6, 0xAA00AA
  STORE r9, r6
  ADD r9, r9, r1
  CALL func_0
func_0:
  ADD r11, r13, r4
  OR r2, r31, r5
  DIV r13, r7, r4
  SHR r14, r11, r1
  OR r8, r5, r3
  RET
  XOR r3, r1, r11
  XOR r12, r13, r6
  AND r15, r12, r4
  AND r6, r9, r0
  PUSH r3
  PUSH r15
  AND r7, r10, r12
  XOR r9, r15, r12
  SUB r9, r28, r10
  DIV r9, r6, r3
  SUB r6, r11, r5
  POP r15
  POP r3
  LDI r1, 44
loop_1:
  ADD r13, r7, r2
  MUL r4, r0, r7
  AND r4, r5, r0
  CMPI r7, r15, 16
  LDI r12, 1
  SUB r1, r1, r12
  JNZ r1, loop_1
  XOR r8, r3, r11
  AND r10, r4, r15
  SHR r22, r2, r6
  SHLI r15, r1, 0
  SHR r10, r7, r14
main_2:
  SUBI r5, r7, 256
  SUBI r12, r10, 10
  LDI r9, 128
  LDI r9, 539
  LDI r14, 2702
  DRAWTEXT r9, r9, r14, "WORLD"
  FRAME
  JMP main_2
