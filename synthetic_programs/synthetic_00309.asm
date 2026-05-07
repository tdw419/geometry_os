; input driven program
; initialization
  LDI r0, 447
  LDI r7, 0x00C0AC
  LDI r28, 16
  LDI r14, 3234
  LDI r4, 8
  LDI r1, 10
  LDI r9, 256
main_0:
  MOD r0, r3, r10
  IKEY r14
  CMPI r14, 0x067FA7
  JNZ r14, key_1
  OR r0, r18, r13
  AND r1, r12, r3
  FRAME
  JMP main_0
