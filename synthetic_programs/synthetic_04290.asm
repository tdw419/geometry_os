; mixed program
; initialization
  LDI r25, 0x184F77
  LDI r13, 271
  LDI r7, 255
  LDI r12, 10
  LDI r1, 2
  LDI r6, 1
  CMP r4, r12
  CALL func_0
func_0:
  SHL r14, r11, r12
  XOR r12, r2, r5
  SUB r11, r5, r6
  MUL r9, r12, r5
  RET
  PUSH r8
  PUSH r9
  SUB r5, r14, r13
  MOD r8, r3, r0
  MUL r12, r14, r3
  OR r8, r14, r11
  SHR r11, r15, r27
  POP r9
  POP r8
  LDI r14, 256
loop_1:
  SHL r4, r5, r10
  LDI r3, 1
  SUB r14, r14, r3
  JNZ r14, loop_1
main_2:
  LDI r6, 440
  LDI r2, 3575
  LDI r8, 16
  PSETI
  SHL r7, r6, r11
  LDI r14, 256
  LDI r6, 1618
  LDI r1, 128
  TEXT r14, r6, r1, "HELLO"
  XOR r8, r10, r1
  OR r5, r6, r0
  AND r0, r14, r31
  XOR r12, r5, r4
  AND r3, r7, r21
  FRAME
  JMP main_2
