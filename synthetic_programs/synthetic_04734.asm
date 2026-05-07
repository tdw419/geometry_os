; mixed program
; initialization
  LDI r6, 0x0C9EA7
  LDI r3, 0x2CD7A7
  LDI r2, 3632
  FILL r2
  LDI r18, 338
  LDI r12, 2627
  LDI r5, 0x75CC8C
  TEXT r18, r12, r5, "HELLO"
  LDI r5, 3720
  LDI r8, 192
  LDI r7, 4
  DRAWTEXT r5, r8, r7, "WORLD"
  IKEY r0
  CMPI r0, 32
  JNZ r0, key_0
  CALL func_1
func_1:
  XOR r12, r1, r13
  MOD r13, r28, r9
  SHR r24, r10, r9
  SUB r24, r12, r1
  SHR r9, r14, r4
  RET
  HALT
