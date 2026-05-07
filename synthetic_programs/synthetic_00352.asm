; input driven program
; initialization
  LDI r5, 8
  LDI r11, 4077
  LDI r10, 0
  LDI r13, 428
  LDI r0, 10
  LDI r14, 0x54D588
  LDI r12, 10
  LDI r1, 16
main_0:
  LDI r28, 0x5DF8F8
  LDI r1, 2
  LDI r10, 0x535563
  PSETI
  LDI r5, 4
  LDI r5, 2307
  LDI r12, 1101
  PSETI
  LDI r10, 8
  LDI r8, 1
  LDI r3, 0xA85947
  TEXT r10, r8, r3, "HELLO"
  IKEY r10
  CMPI r10, 0x743FFD
  JNZ r10, key_1
  XOR r2, r11, r10
  AND r15, r10, r0
  XOR r2, r15, r14
  AND r3, r13, r1
  FRAME
  JMP main_0
