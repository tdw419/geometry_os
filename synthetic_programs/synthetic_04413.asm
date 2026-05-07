; mixed program
; initialization
  LDI r3, 64
  LDI r4, 0xE9D04A
  LDI r14, 2
  LDI r15, 2675
  LDI r10, 1107
  OR r2, r17, r13
  AND r13, r11, r3
  LDI r5, 256
  STORE r5, r14
  LOAD r6, r5
  LDI r5, 2732
  STORE r5, r2
  LOAD r11, r5
  LDI r10, 0x4D1550
  LDI r2, 0
  LDI r2, 32
  WPIXEL
  IKEY r13
  CMPI r13, 0x9FE4B6
  JNZ r13, key_0
  XOR r3, r15, r10
  XOR r3, r12, r1
main_1:
  AND r3, r15, r8
  AND r3, r14, r8
  OR r13, r0, r7
  OR r3, r12, r2
  SHR r12, r9, r15
  SHL r15, r7, r27
  SHL r15, r0, r12
  SHLI r1, r12, 0xC173C4
  AND r5, r9, r22
  XOR r2, r4, r1
  OR r9, r5, r11
  XOR r9, r6, r0
  FRAME
  JMP main_1
