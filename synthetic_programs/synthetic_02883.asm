; input driven program
; initialization
  LDI r10, 0x17965C
  LDI r0, 0xF736EA
  LDI r14, 296
  LDI r11, 527
  LDI r5, 0xE5F5CD
  LDI r7, 255
  LDI r6, 3806
main_0:
  LDI r12, 4
  LDI r3, 0x971059
  LDI r0, 32
  TEXT r12, r3, r0, "HELLO"
  MUL r1, r5, r13
  IKEY r0
  CMPI r0, 0xE65C38
  JNZ r0, key_1
  OR r10, r5, r2
  XOR r15, r8, r10
  XOR r11, r7, r13
  OR r15, r2, r16
  XOR r5, r11, r9
  AND r4, r12, r9
  OR r12, r8, r14
  SHR r4, r6, r5
  FRAME
  JMP main_0
