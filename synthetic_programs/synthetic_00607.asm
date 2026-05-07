; mixed program
; initialization
  LDI r1, 256
  LDI r8, 2221
  LDI r12, 0xE0AE68
  LDI r7, 0xC50342
  LDI r3, 16
  LDI r4, 0x85309F
  LDI r14, 128
  SHR r12, r14, r10
  SAR r10, r13, r4
  SAR r8, r15, r3
  LDI r10, 0xEF017E
  LDI r17, 0x8BE5A0
  LDI r11, 295
  TEXT r10, r17, r11, "HELLO"
  SHLI r11, r1, 8
  SHR r5, r6, r28
  SHL r19, r23, r7
  XOR r1, r18, r13
  CALL func_0
func_0:
  MUL r14, r7, r6
  OR r15, r8, r1
  RET
  CMP r8, r10
main_1:
  SUB r1, r2, r15
  LDI r4, 562
  LDI r8, 0x4259AB
  LDI r13, 2070
  DRAWTEXT r4, r8, r13, "WORLD"
  AND r4, r3, r6
  OR r30, r8, r13
  SUBI r15, r6, 32
  FRAME
  JMP main_1
