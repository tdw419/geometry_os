; mixed program
; initialization
  LDI r7, 0xAC238D
  LDI r11, 2
  LDI r1, 0
; palette
  LDI r8, 0x2097
  LDI r13, 1
  LDI r1, 0x000066
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x008888
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x00FF00
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x0000FF
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x880088
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x0044FF
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0xFFAA00
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x444444
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0xFF8800
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x44FF00
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x0044FF
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0x00FFAA
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0xFFAA00
  STORE r8, r1
  ADD r8, r8, r13
  LDI r1, 0xFF8800
  STORE r8, r1
  ADD r8, r8, r13
  IKEY r31
  CMPI r31, 18
  JNZ r31, key_0
  CALL func_1
func_1:
  SHL r8, r5, r14
  XOR r3, r2, r6
  MOD r3, r4, r5
  RET
  SAR r3, r15, r1
  SHL r11, r5, r3
  SHL r7, r13, r15
  SHL r6, r3, r11
  CMP r11, r13
  PUSH r8
  XOR r7, r15, r9
  SHR r5, r2, r3
  XOR r7, r4, r8
  ADD r7, r24, r0
  DIV r13, r3, r4
  POP r8
main_2:
  CMP r12, r2
  LDI r14, 0x5C0E34
  LDI r4, 389
  LDI r12, 0xD6D06B
  WPIXEL
  LDI r5, 2
  LDI r3, 0xD46E19
  LDI r6, 0x2F6618
  DRAWTEXT r5, r3, r6, "WORLD"
  SHL r2, r13, r15
  SAR r1, r15, r2
  ANDI r5, r0, 4
  XOR r4, r13, r3
  FRAME
  JMP main_2
