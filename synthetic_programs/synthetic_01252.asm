; mixed program
; initialization
  LDI r12, 3594
  LDI r14, 176
  SUB r12, r9, r5
  LDI r9, 64
loop_0:
  OR r8, r7, r1
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_0
  LDI r23, 0x13FB64
  STORE r23, r6
  LOAD r4, r23
  LDI r4, 1035
  STORE r4, r15
  LOAD r2, r4
  LDI r24, 1434
  STORE r24, r1
  LOAD r2, r24
  XOR r14, r6, r9
  OR r9, r2, r8
  AND r2, r8, r3
  CALL func_1
func_1:
  OR r11, r3, r13
  MUL r21, r2, r0
  XOR r3, r6, r5
  SUB r0, r4, r10
  AND r15, r14, r9
  RET
  LDI r2, 3416
  LDI r29, 2988
  LDI r15, 0xFE4381
  PSET r2, r29, r15
main_2:
  IKEY r11
  CMPI r11, 51
  JNZ r11, key_3
  AND r5, r13, r11
  AND r13, r3, r6
  AND r2, r10, r14
  OR r6, r15, r4
  OR r5, r15, r10
  XOR r11, r2, r1
  OR r1, r8, r5
  IKEY r15
  CMPI r15, 0xDF048D
  JNZ r15, key_4
  FRAME
  JMP main_2
