; drawing loop program
; initialization
  LDI r13, 2680
  LDI r12, 0
  LDI r0, 3771
  LDI r9, 3660
  LDI r7, 32
  LDI r28, 0
  LDI r14, 10
main_0:
  SUB r9, r31, r15
  IKEY r1
  CMPI r1, 69
  JNZ r1, key_1
  CMPI r3, r6, 16
  SHR r12, r8, r23
  SAR r15, r9, r12
  SHL r11, r8, r6
  LDI r13, 0xDE5AD9
  LDI r1, 237
  LDI r4, 128
  TEXT r13, r1, r4, "HELLO"
  OR r12, r5, r7
  OR r12, r15, r7
  AND r9, r1, r8
  XOR r4, r13, r0
  FRAME
  JMP main_0
