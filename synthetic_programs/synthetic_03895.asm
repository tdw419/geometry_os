; mixed program
; initialization
  LDI r12, 0xA46F9B
  LDI r0, 255
  LDI r13, 3054
  LDI r5, 0xA031E7
  LDI r7, 0xA2CBA0
  LDI r9, 0x1666C2
  PUSH r8
  PUSH r2
  PUSH r14
  SHL r15, r2, r11
  AND r6, r15, r14
  MUL r5, r9, r7
  POP r14
  POP r2
  POP r8
  SHL r12, r15, r6
  LDI r15, 0x1BED24
  STORE r15, r8
  LOAD r4, r15
  LDI r0x23160, 0x23166
  STORE r10, r10
  LOAD r0, r10
  LDI r1, 0x22A4xE73EE4
  STORE r1, r15
  LOAD r11, r1
  LDI r3, 0x6D2CA7
  STORE r3, r4
  LOAD r14, r3
  LDI r14, 4
  STORE r14, r3
  LOAD r13, r14
  LDI r4, 3501
  STORE r4, r12
  LOAD r0, r4
  LDI r3, 8
  FILL r3
  LDI r15, 49
loop_0:
  ADDI r3, r0, 149
  ANDI r8, r5, 221
  LDI r0, 1
  SUB r15, r15, r0
  JNZ r15, loop_0
  AND r14, r20, r12
  AND r8, r2, r15
  XOR r1, r2, r6
  AND r6, r8, r2
  HALT
