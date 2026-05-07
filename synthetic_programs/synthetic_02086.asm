; mixed program
; initialization
  LDI r14, 32
  LDI r30, 0xC27271
  LDI r4, 2703
  LDI r7, 0x9D727E
  LDI r0, 2665
  LDI r13, 0x55FECA
  LDI r0, 256
  LDI r19, 0xA62CB5
  LDI r5, 3144
  TEXT r0, r19, r5, "HELLO"
  CALL func_0
func_0:
  SHL r14, r4, r10
  OR r31, r1, r14
  RET
  OR r12, r16, r10
main_1:
  LDI r19, 16
  LDI r10, 481
  LDI r11, 155
  LDI r5, 0x4BE00A
  LDI r6, 32
  LINE r19, r10, r11, r5, r6
  OR r7, r2, r9
  AND r12, r15, r2
  OR r12, r1, r18
  AND r25, r6, r1
  OR r8, r15, r5
  OR r31, r3, r4
  XOR r3, r1, r8
  IKEY r26
  CMPI r26, 8
  JNZ r26, key_2
  FRAME
  JMP main_1
