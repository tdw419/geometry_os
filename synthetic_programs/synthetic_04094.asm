; mixed program
; initialization
  LDI r3, 2453
  LDI r8, 4
  IKEY r11
  CMPI r11, 145
  JNZ r11, key_0
  LDI r14, 0
  LDI r11, 0xFA0554
  LDI r0, 1
  DRAWTEXT r14, r11, r0, "WORLD"
  PUSH r4
  SUB r0, r8, r9
  OR r3, r14, r6
  DIV r13, r0, r4
  POP r4
  SHR r28, r11, r10
  SAR r0, r14, r9
  SAR r10, r11, r6
  SHL r4, r0, r15
  CALL func_1
func_1:
  MUL r13, r3, r2
  ADD r10, r19, r12
  RET
  LDI r15, 2232
  LDI r14, 4
  LDI r14, 3810
  TEXT r15, r14, r14, "HELLO"
  SHLI r1, r14, 256
  SHL r7, r2, r10
  SAR r15, r3, r1
  SHR r7, r2, r0
  HALT
