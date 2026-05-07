; mixed program
; initialization
  LDI r5, 128
  LDI r6, 0xCFE323
  LDI r8, 0xD10F39
  LDI r7, 256
  LDI r12, 32
; palette
  LDI r4, 0x606C
  LDI r1, 1
  LDI r11, 0x000000
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0xFFEE00
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x00AAFF
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x888800
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x00AAFF
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x444444
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x000000
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0xFFFFFF
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x0044FF
  STORE r4, r11
  ADD r4, r4, r1
  LDI r11, 0x00FF44
  STORE r4, r11
  ADD r4, r4, r1
  SHR r4, r9, r15
  SHR r14, r5, r1
  SAR r0, r4, r8
  LDI r13, 32
  LDI r3, 758
  LDI r11, 0x37C665
  DRAWTEXT r13, r3, r11, "WORLD"
  CALL func_0
func_0:
  AND r4, r15, r3
  MUL r0, r3, r4
  RET
  PUSH r5
  PUSH r9
  SUB r5, r1, r7
  SHL r3, r6, r1
  SHL r13, r11, r6
  DIV r2, r3, r8
  SHL r15, r8, r12
  POP r9
  POP r5
  LDI r5, 4
  LDI r13, 310
  LDI r4, 1712
  TEXT r5, r13, r4, "HELLO"
  LDI r15, 0x7A4B1B
  LDI r4, 1693
  LDI r13, 3096
  TEXT r15, r4, r13, "HELLO"
  LDI r2, 32
loop_1:
  DIV r5, r13, r11
  LDI r10, 1
  SUB r2, r2, r10
  JNZ r2, loop_1
  SHR r7, r8, r4
  SHLI r9, r15, 4
  SAR r8, r9, r0
  SAR r8, r13, r6
  HALT
