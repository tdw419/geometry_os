; mixed program
; initialization
  LDI r8, 2
  LDI r0, 2158
  LDI r27, 4
  LDI r10, 128
  LDI r5, 2176
  LDI r12, 3005
  LDI r9, 0xF8EEA4
  DRAWTEXT r5, r12, r9, "WORLD"
  CMPI r6, 0xFD572C
  DIV r3, r9, r7
  LDI r3, 2514
  LDI r13, 128
  LDI r4, 255
  PSET r3, r13, r4
  SAR r9, r15, r13
  SHLI r13, r3, 8
  SHL r1, r11, r7
  SHR r8, r14, r11
  CALL func_0
func_0:
  SHR r7, r11, r8
  SHL r15, r11, r0
  ADD r0, r14, r13
  OR r12, r14, r3
  RET
main_1:
  LDI r6, 4
  LDI r8, 0x2D0501
  LDI r10, 10
  DRAWTEXT r6, r8, r10, "WORLD"
  ADDI r15, r2, 0x26B140
  CMPI r6, r10, 0x0576BD
  LDI r6, 10
  LDI r2, 2643
  LDI r9, 256
  TEXT r6, r2, r9, "HELLO"
  FRAME
  JMP main_1
