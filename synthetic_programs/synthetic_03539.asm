; mixed program
; initialization
  LDI r6, 32
  LDI r8, 256
  LDI r15, 8
  LDI r3, 0x6BB022
  CMPI r10, 177
  LDI r1, 0x283F4B
  STORE r1, r10
  LOAD r7, r1
  LDI r15, 0x608F
  STORE r15, r12
  LOAD r11, r15
  LDI r24, 128
  STORE r24, r10
  LOAD r9, r24
  LDI r0, 0xF50BEA
  STORE r0, r9
  LOAD r5, r0
  OR r13, r4, r3
  PUSH r7
  PUSH r1
  SHR r3, r1, r15
  SUB r10, r11, r6
  SHR r0, r14, r12
  XOR r3, r6, r12
  SHR r9, r3, r14
  POP r1
  POP r7
  LDI r3, 0xCFACF3
  STORE r3, r1
  LOAD r9, r3
  LDI r10x203A, 0xE21580
  STORE r14, r11
  LOAD r13, r14
  IKEY r0
  CMPI r0, 256
  JNZ r0, key_0
main_1:
  IKEY r8
  CMPI r8, 29
  JNZ r8, key_2
  XOR r5, r10, r15
  XOR r0, r11, r1
  IKEY r1
  CMPI r1, 32
  JNZ r1, key_3
  ANDI r9, r2, 230
  FRAME
  JMP main_1
