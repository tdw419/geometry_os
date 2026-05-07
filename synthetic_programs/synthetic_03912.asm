; mixed program
; initialization
  LDI r14, 0xB3BCEB
  LDI r15, 1715
  LDI r12, 1659
  LDI r11, 2402
  LDI r7, 0xFDC20D
  CALL func_0
func_0:
  SHR r1, r25, r11
  MUL r4, r9, r12
  SHL r24, r10, r4
  AND r11, r9, r14
  MOD r3, r4, r7
  RET
  LDI r8, 0xEADD08
  LDI r2, 1764
  LDI r13, 0x84FB06
  DRAWTEXT r8, r2, r13, "WORLD"
  PUSH r10
  PUSH r15
  PUSH r4
  SUB r6, r3, r0
  OR r5, r8, r9
  SHL r8, r4, r1
  DIV r8, r5, r0
  ADD r7, r4, r2
  POP r4
  POP r15
  POP r10
  CALL func_1
func_1:
  DIV r13, r11, r9
  DIV r11, r13, r17
  XOR r12, r4, r15
  SHR r3, r7, r15
  XOR r6, r8, r0
  SUB r1, r12, r2
  RET
  PUSH r7
  MOD r3, r5, r13
  SHL r12, r10, r13
  ADD r11, r7, r3
  POP r7
  LDI r1, 128
  STORE r1, r3
  LOAD r7, r1
  LDI r26, 3766
  STORE r26, r3
  LOAD r5, r26
  LDI r15, 255
  STORE r15, r6
  LOAD r0, r15
  LDI r11, 0xEB82DA
  STORE r11, r3
  LOAD r10, r11
  LDI r13, 0xB86E62
  STORE r13, r4
  LOAD r15, r13
  OR r10, r12, r5
  XOR r15, r10, r3
  XOR r6, r5, r16
main_2:
  CMP r8, r1
  CMPI r12, 1
  OR r9, r0, r8
  LDI r6, 0x9B3F52
  LDI r2, 0x827777
  LDI r15, 128
  DRAWTEXT r6, r2, r15, "WORLD"
  FRAME
  JMP main_2
