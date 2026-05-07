; mixed program
; initialization
  LDI r9, 256
  LDI r24, 0x6334B7
  LDI r8, 0xE993B8
  XOR r12, r11, r28
  XOR r13, r0, r27
  OR r8, r16, r4
  LDI r12, 1663
  STORE r12, r5
  LOAD r6, r12
  LDI r22, 0xDDF3CC
  STORE r22, r12
  LOAD r3, r22
  OR r3, r12, r4
  XOR r3, r14, r8
  AND r15, r7, r11
  LDI r1, 15
loop_0:
  LDI r11, 0
  LDI r1, 0x5A1A7A
  LDI r11, 256
  WPIXEL
  LDI r9, 1
  SUB r1, r1, r9
  JNZ r1, loop_0
main_1:
  IKEY r7
  CMPI r7, 49
  JNZ r7, key_2
  CMP r8, r6
  OR r0, r10, r4
  XOR r10, r14, r4
  AND r4, r7, r14
  XOR r0, r12, r3
  OR r9, r8, r11
  AND r10, r24, r12
  AND r0, r14, r11
  FRAME
  JMP main_1
