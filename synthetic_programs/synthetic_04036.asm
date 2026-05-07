; mixed program
; initialization
  LDI r14, 3111
  LDI r11, 1288
  LDI r1, 1618
  LDI r10, 1912
  LDI r9, 1789
; palette
  LDI r12, 0x7096
  LDI r13, 1
  LDI r5, 0x0000FF
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0x000066
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFFAA00
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFF4400
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xDD0044
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xFF00FF
  STORE r12, r5
  ADD r12, r12, r13
  LDI r5, 0xDD0044
  STORE r12, r5
  ADD r12, r12, r13
  LDI r14, 3162
  LDI r15, 8
  LDI r5, 0x24741D
  PSET r14, r15, r5
  CMP r0, r1
  JNZ r0, else_0
  SHL r6, r2, r13
  JMP endif_1
else_0:
  LDI r8, 0x561475
  LDI r12, 16
  LDI r29, 1024
  LDI r6, 2565
  LDI r9, 0x54E373
  LINE r8, r12, r29, r6, r9
  LDI r7, 256
  FILL r7
endif_1:
  CALL func_2
func_2:
  MUL r5, r1, r9
  SHL r7, r13, r6
  RET
  IKEY r11
  CMPI r11, 0xCC4A03
  JNZ r11, key_3
  LDI r9, 255
  LDI r12, 1385
  LDI r4, 0x87A117
  WPIXEL
  PUSH r9
  PUSH r1
  PUSH r12
  DIV r15, r13, r9
  XOR r25, r14, r11
  POP r12
  POP r1
  POP r9
  DIV r0, r31, r13
main_4:
  MUL r28, r5, r13
  SUBI r8, r6, 140
  DIV r11, r8, r12
  FRAME
  JMP main_4
