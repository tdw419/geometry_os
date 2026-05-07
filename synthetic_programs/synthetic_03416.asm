; mixed program
; initialization
  LDI r1, 911
  LDI r3, 0x7AA925
  LDI r8, 1
  LDI r15, 356
  LDI r7, 8
  LDI r6, 256
  LDI r13, 356
  LDI r9, 0x28DBB6
  CMP r9, r13
  PUSH r2
  PUSH r5
  DIV r13, r8, r10
  DIV r4, r11, r3
  MUL r13, r6, r14
  MOD r4, r13, r8
  POP r5
  POP r2
  LDI r8, 0x75BD38
  STORE r8, r14
  LOAD r2, r8
  LDI r3, 2678
  STORE r3, r6
  LOAD r13, r3
  LDI r1, 2581
  STORE r1, r7
  LOAD r14, r1
  LDI r2, 0x280639
  STORE r2, r12
  LOAD r1, r2
  LDI r13, 1
  STORE r13, r14
  LOAD r9, r13
  PUSH r11
  PUSH r8
  XOR r10, r12, r0
  AND r4, r6, r12
  ADD r5, r14, r10
  POP r8
  POP r11
  LDI r8, 16
loop_0:
  LDI r5, 1360
  FILL r5
  CMPI r13, r12, 2
  LDI r5, 1
  SUB r8, r8, r5
  JNZ r8, loop_0
  LDI r9, 1055
  LDI r9, 8
  LDI r3, 0x56C487
  DRAWTEXT r9, r9, r3, "WORLD"
  SHR r2, r0, r9
  SAR r7, r14, r3
  HALT
