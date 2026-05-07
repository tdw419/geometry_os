; mixed program
; initialization
  LDI r13, 0x12CD59
  LDI r6, 255
  LDI r4, 3557
  LDI r8, 872
  LDI r10, 1261
  LDI r7, 3089
  LDI r11, 0xB47EF5
  CMPI r3, 62
  SHR r0, r8, r1
  SHL r11, r9, r1
  SHL r15, r4, r2
  LDI r3, 1234
  STORE r3, r11
  LOAD r9, r3
  LDI r6, 0x20A37C
  STORE r6, r2
  LOAD r9, r6
  LDI r14, 0x1F21A8
  LDI r0, 0x6FE0C0
  LDI r1, 255
  PSETI
  CALL func_0
func_0:
  SHR r1, r3, r6
  SUB r3, r7, r9
  SHL r13, r8, r12
  RET
main_1:
  LDI r6, 10
  LDI r0, 1223
  LDI r1, 0x471D5B
  PSET r6, r0, r1
  ADDI r2, r5, 4
  SHR r16, r3, r1
  LDI r8, 128
  LDI r13, 437
  LDI r18, 1513
  DRAWTEXT r8, r13, r18, "WORLD"
  FRAME
  JMP main_1
