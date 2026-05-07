; mixed program
; initialization
  LDI r9, 0xE0C5A1
  LDI r13, 256
  LDI r0, 1289
  LDI r8, 1519
  LDI r11, 3846
  PSETI
  LDI r10, 0x74E217
  LDI r21, 32
  LDI r4, 0x8D9E4B
  DRAWTEXT r10, r21, r4, "WORLD"
  CALL func_0
func_0:
  OR r21, r11, r3
  SHR r8, r0, r15
  SHL r15, r8, r2
  RET
  LDI r5, 3381
  LDI r1, 1596
  LDI r12, 0x0A73FF
  TEXT r5, r1, r12, "HELLO"
  PUSH r11
  PUSH r7
  PUSH r15
  PUSH r15
  MOD r0, r14, r8
  MUL r14, r13, r4
  SHR r3, r10, r11
  POP r15
  POP r15
  POP r7
  POP r11
main_1:
  SHL r11, r7, r3
  SAR r5, r10, r8
  SHR r15, r6, r10
  CMP r1, r6
  CMPI r4, r0, 0x9A79CE
  LDI r15, 3759
  LDI r14, 3209
  LDI r2, 10
  LDI r9, 1512
  CIRCLE r15, r14, r2, r9
  OR r5, r14, r9
  XOR r8, r11, r10
  XOR r10, r1, r20
  OR r13, r4, r27
  AND r5, r13, r12
  FRAME
  JMP main_1
