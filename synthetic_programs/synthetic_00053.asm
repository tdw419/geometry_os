; mixed program
; initialization
  LDI r6, 2317
  LDI r1, 3124
  LDI r8, 0xCC3EE2
  LDI r12, 0x4EEABD
  LDI r15, 2540
  LDI r4, 10
  LDI r13, 0xD856AF
  LDI r5, 0
  IKEY r4
  CMPI r4, 42
  JNZ r4, key_0
  LDI r2, 2
loop_1:
  ANDI r13, r1, 55
  SHR r8, r2, r0
  LDI r14, 1
  SUB r2, r2, r14
  JNZ r2, loop_1
  CMPI r1, 0x986541
  LDI r14, 2
  STORE r14, r3
  LOAD r0, r14
  LDI r3, 0xF4490E
  STORE r3, r11
  LOAD r12, r3
  LDI r2, 0x071ABE
  STORE r2, r4
  LOAD r13, r2
  LDI r6, 0xED461D
  STORE r6, r4
  LOAD r14, r6
  LDI r31, 0xE626FF
  STORE r31, r3
  LOAD r13, r31
  SAR r12, r15, r1
  SHL r10, r8, r13
  SHLI r11, r13, 0x937626
  PUSH r14
  PUSH r7
  XOR r14, r9, r12
  SHR r11, r5, r9
  SUB r4, r5, r3
  SHR r15, r6, r0
  POP r7
  POP r14
main_2:
  AND r1, r10, r7
  AND r15, r10, r1
  XOR r4, r3, r14
  OR r19, r1, r5
  DIV r5, r14, r15
  MUL r10, r3, r14
  ADDI r15, r5, 0xBEAFFA
  FRAME
  JMP main_2
