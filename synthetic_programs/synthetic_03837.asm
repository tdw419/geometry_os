; mixed program
; initialization
  LDI r6, 0x9684C4
  LDI r4, 255
  XOR r5, r10, r25
  LDI r14, 0x0E5E18
  LDI r1, 0xF6E539
  LDI r11, 1578
  PSET r14, r1, r11
  PUSH r13
  MUL r10, r1, r2
  AND r7, r21, r5
  XOR r0, r23, r7
  OR r5, r6, r14
  SHR r10, r29, r6
  POP r13
  OR r12, r1, r25
  XOR r5, r7, r2
  AND r5, r0, r10
  OR r11, r0, r13
main_0:
  IKEY r10
  CMPI r10, 13
  JNZ r10, key_1
  IKEY r0
  CMPI r0, 0xB9CC57
  JNZ r0, key_2
  LDI r25, 1567
  LDI r3, 0xC0F530
  LDI r5, 1695
  TEXT r25, r3, r5, "HELLO"
  XOR r13, r15, r11
  XOR r10, r15, r14
  CMPI r14, 0xA65316
  FRAME
  JMP main_0
