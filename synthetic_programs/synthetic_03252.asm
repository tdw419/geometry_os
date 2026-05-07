; mixed program
; initialization
  LDI r2, 0xF6D12C
  LDI r10, 0x6975F6
  LDI r4, 8
  AND r1, r11, r17
  LDI r6, 3049
  STORE r6, r12
  LOAD r2, r6
  LDI r16, 1598
  STORE r16, r8
  LOAD r15, r16
  LDI r15, 317
  STORE r15, r6
  LOAD r14, r15
  LDI r7, 128
  LDI r15, 3842
  LDI r14, 3992
  TEXT r7, r15, r14, "HELLO"
  CALL func_0
func_0:
  SHR r6, r8, r10
  XOR r15, r9, r7
  MUL r3, r1, r11
  SUB r4, r14, r11
  DIV r11, r3, r5
  RET
  PUSH r11
  PUSH r5
  PUSH r13
  PUSH r8
  ADD r1, r15, r2
  SUB r5, r14, r2
  AND r13, r8, r6
  DIV r5, r10, r9
  XOR r6, r3, r0
  POP r8
  POP r13
  POP r5
  POP r11
  HALT
