; input driven program
; initialization
  LDI r9, 16
  LDI r14, 0xA8C3F0
  LDI r15, 2
  LDI r12, 1508
  LDI r5, 255
  LDI r27, 0x86AB0B
  LDI r10, 3853
  LDI r2, 0
main_0:
  SHL r4, r1, r3
  SHR r1, r2, r0
  SHR r15, r1, r11
  SHL r15, r12, r8
  LDI r12, 0x39DC4D
  LDI r14, 0xCEC4CA
  LDI r6, 0x932765
  TEXT r12, r14, r6, "HELLO"
  IKEY r12
  CMPI r12, 2
  JNZ r12, key_1
  SAR r1, r4, r0
  SHR r0, r5, r10
  SAR r12, r0, r5
  SHLI r5, r14, 256
  SHLI r15, r8, 2
  SAR r13, r4, r0
  FRAME
  JMP main_0
