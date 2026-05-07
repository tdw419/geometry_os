; mixed program
; initialization
  LDI r15, 3399
  LDI r7, 0x20ED81
  LDI r2, 8
  LDI r6, 0x2C4138
  LDI r1, 0xA5FFDA
  LDI r14, 0xF82669
  LDI r11, 256
  DIV r7, r8, r15
  SUB r7, r0, r14
  LDI r15, 64
loop_0:
  LDI r12, 560
  LDI r14, 128
  LDI r5, 10
  WPIXEL
  LDI r13, 1
  SUB r15, r15, r13
  JNZ r15, loop_0
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_1
  LDI r15, 3579
  STORE r15, r4
  LOAD r13, r15
  LDI r2, 32
  STORE r2, r7
  LOAD r3, r2
  LDI r6, 0x491AA5
  STORE r6, r10
  LOAD r4, r6
  LDI r4, 3095
  LDI r6, 1112
  LDI r18, 150
  TEXT r4, r6, r18, "HELLO"
  LDI r11, 0x893831
loop_2:
  OR r0, r9, r15
  OR r12, r2, r14
  LDI r18, 1
  SUB r11, r11, r18
  JNZ r11, loop_2
  DIV r13, r2, r3
main_3:
  LDI r19, 129
  LDI r1, 3012
  LDI r2, 3773
  LDI r4, 64
  LDI r13, 2
  LINE r19, r1, r2, r4, r13
  AND r10, r12, r5
  OR r10, r9, r29
  XOR r9, r6, r14
  XOR r9, r11, r13
  CMPI r9, r14, 0xC93D41
  FRAME
  JMP main_3
