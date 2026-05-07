; mixed program
; initialization
  LDI r15, 0x34B493
  LDI r5, 1677
  LDI r13, 64
  LDI r8, 0x87D9AA
  LDI r7, 2881
  LDI r11, 1
  SAR r1, r3, r4
  SHL r1, r12, r14
  CMP r8, r1
  OR r4, r6, r5
  AND r5, r3, r7
  XOR r10, r5, r12
  OR r13, r3, r7
main_0:
  CMP r7, r5
  IKEY r15
  CMPI r15, 256
  JNZ r15, key_1
  OR r31, r4, r10
  FRAME
  JMP main_0
