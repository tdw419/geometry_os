; mixed program
; initialization
  LDI r1, 985
  LDI r10, 0x5E980A
  LDI r14, 256
  LDI r6, 2011
  LDI r11, 0x3F6B8A
  AND r13, r1, r2
  XOR r6, r5, r8
  XOR r29, r6, r12
  SHR r6, r14, r1
  LDI r14, 42
loop_0:
  CMPI r5, r13, 116
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_0
  LDI r0x40F73, 2
  STORE r13, r5
  LOAD r9, r13
  LDI r1, 1445
  STORE r1, r12
  LOAD r11, r1
  LDI r12, 0xF91CAE
  STORE r12, r7
  LOAD r8, r12
  LDI r13, 255
  STORE r13, r6
  LOAD r15, r13
  LDI r4, 3622
  STORE r4, r12
  LOAD r11, r4
  CMP r12, r10
  HALT
