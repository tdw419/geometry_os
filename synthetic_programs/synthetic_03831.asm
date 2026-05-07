; mixed program
; initialization
  LDI r2, 2586
  LDI r0, 1701
  XOR r9, r11, r1
  OR r6, r12, r25
  XOR r15, r8, r12
  CMP r8, r10
  CMP r5, r12
  JNZ r5, else_0
  MOD r14, r8, r3
  MUL r5, r11, r4
  SHR r8, r10, r9
  MOD r6, r13, r8
  JMP endif_1
else_0:
  LDI r13, 16
  LDI r12, 255
  LDI r8, 1
  PSET r13, r12, r8
  LDI r9, 1747
  LDI r0, 32
  LDI r6, 0x2F7E1B
  LDI r2, 256
  CIRCLE r9, r0, r6, r2
  LDI r10, 0x9A7D3E
  LDI r6, 0x85016E
  LDI r1, 3209
  PSETI
  LDI r12, 4
  LDI r13, 1857
  LDI r3, 64
  LDI r13, 256
  LDI r2, 4093
  LINE r12, r13, r3, r13, r2
endif_1:
  LDI r0, 4
  STORE r0, r8
  LOAD r3, r0
  LDI r0, 1721
  STORE r0, r4
  LOAD r7, r0
  LDI r12, 10
  STORE r12, r7
  LOAD r9, r12
  HALT
