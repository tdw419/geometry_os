; mixed program
; initialization
  LDI r0, 0x08A756
  LDI r12, 8
  LDI r2, 377
  LDI r9, 1841
  LDI r16, 823
  LDI r8, 64
  LDI r11, 3521
  LDI r6, 0x481A70
  CALL func_0
func_0:
  XOR r12, r0, r13
  OR r3, r15, r2
  SHL r13, r14, r0
  XOR r0, r4, r11
  AND r5, r9, r16
  XOR r4, r14, r10
  RET
  LDI r9, 1130
  LDI r12, 791
  LDI r4, 0xCE3D7F
  LDI r13, 0x534FE0
  CIRCLE r9, r12, r4, r13
  CMPI r2, 135
  PUSH r4
  PUSH r11
  PUSH r11
  ADD r4, r11, r0
  XOR r1, r12, r10
  SHR r1, r6, r8
  AND r21, r10, r8
  ADD r15, r5, r8
  POP r11
  POP r11
  POP r4
  PUSH r4
  PUSH r18
  PUSH r11
  PUSH r2
  SHL r1, r11, r21
  AND r3, r18, r13
  POP r2
  POP r11
  POP r18
  POP r4
  LDI r11, 0xE194DE
  LDI r4, 0x10CED6
  LDI r13, 37
  PSETI
  XOR r2, r9, r10
  XOR r4, r14, r6
  OR r8, r15, r13
  PUSH r20
  DIV r2, r10, r11
  OR r12, r5, r9
  DIV r27, r7, r4
  SHR r12, r13, r7
  MOD r6, r5, r7
  POP r20
main_1:
  SUBI r10, r14, 25
  ANDI r10, r11, 128
  CMPI r1, 10
  ADD r9, r3, r19
  FRAME
  JMP main_1
