; mixed program
; initialization
  LDI r11, 16
  LDI r0, 1485
  LDI r7, 10
  LDI r9, 1771
  LDI r13, 0xE32EE2
  LDI r2, 4058
  XOR r1, r9, r4
  XOR r5, r3, r0
  XOR r10, r3, r6
  AND r1, r15, r12
  CALL func_0
func_0:
  SHR r8, r12, r15
  SUB r15, r14, r3
  ADD r13, r4, r5
  MOD r1, r10, r15
  RET
  LDI r10, 64
  LDI r12, 0
  LDI r4, 255
  DRAWTEXT r10, r12, r4, "WORLD"
  LDI r13, 0x8CA875
loop_1:
  ANDI r3, r11, 0xD27887
  MUL r13, r1, r7
  ADD r13, r5, r0
  LDI r20, 1502
  LDI r6, 2585
  LDI r19, 0x449885
  PSETI
  LDI r12, 1
  SUB r13, r13, r12
  JNZ r13, loop_1
  PUSH r11
  PUSH r8
  PUSH r14
  PUSH r3
  DIV r10, r6, r12
  MUL r14, r12, r3
  SUB r2, r7, r8
  MOD r4, r1, r7
  SHL r14, r6, r9
  POP r3
  POP r14
  POP r8
  POP r11
main_2:
  OR r0, r11, r5
  XOR r14, r13, r7
  XOR r2, r10, r22
  XOR r9, r6, r12
  SHL r9, r1, r4
  SHL r4, r7, r3
  CMP r13, r8
  SHR r13, r5, r10
  SHR r14, r3, r12
  SHR r29, r27, r2
  SHR r11, r8, r14
  SUBI r4, r1, 133
  XOR r13, r1, r14
  AND r2, r11, r27
  OR r11, r4, r30
  FRAME
  JMP main_2
