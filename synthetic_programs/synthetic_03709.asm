; mixed program
; initialization
  LDI r7, 3715
  LDI r9, 2696
  LDI r5, 2
  LDI r13, 256
  LDI r8, 3353
  LDI r31, 32
  CMP r1, r6
  JZ r1, else_0
  XOR r12, r11, r7
  OR r8, r24, r12
  MUL r0, r11, r27
  MUL r13, r7, r5
  JMP endif_1
else_0:
  LDI r0, 0xBF4F8D
  FILL r0
endif_1:
  CMPI r14, 8
  CALL func_2
func_2:
  OR r1, r13, r12
  OR r14, r11, r5
  RET
  LDI r12, 2054
  STORE r12, r1
  LOAD r0, r12
  LDI r3, 2663
  STORE r3, r3
  LOAD r11, r3
  LDI r3, 663
  STORE r3, r11
  LOAD r2, r3
  LDI r1, 8
loop_3:
  LDI r23, 2361
  LDI r3, 0x3B0951
  LDI r2, 2251
  WPIXEL
  ADD r30, r14, r1
  LDI r14, 2
  LDI r7, 888
  LDI r10, 0x51779F
  LDI r4, 64
  LDI r2, 0x6A6E2E
  LINE r14, r7, r10, r4, r2
  LDI r8, 106
  LDI r9, 8
  LDI r1, 312
  LDI r2, 3566
  LDI r8, 0x4D9864
  LINE r8, r9, r1, r2, r8
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_3
  CMP r13, r10
  IKEY r21
  CMPI r21, 0x7AFFB2
  JNZ r21, key_4
  LDI r6, 1418
  STORE r6, r4
  LOAD r1, r6
  LDI r15, 0x2B0C54
  STORE r15, r0
  LOAD r3, r15
  LDI r0, 0xDF4FA2
  STORE r0, r9
  LOAD r10, r0
  LDI r5, 8
  STORE r5, r1
  LOAD r13, r5
  HALT
