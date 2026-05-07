; drawing loop program
; initialization
  LDI r4, 64
  LDI r5, 0x73CA7A
  LDI r15, 0x948C17
  LDI r8, 0x046000
main_0:
  CMPI r5, 255
  OR r5, r13, r22
  XOR r6, r10, r0
  XOR r9, r7, r15
  IKEY r10
  CMPI r10, 34
  JNZ r10, key_1
  FRAME
  JMP main_0
