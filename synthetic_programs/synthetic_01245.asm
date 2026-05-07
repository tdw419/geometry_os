; mixed program
; initialization
  LDI r11, 2
  LDI r5, 574
  LDI r0, 0x03B472
  LDI r15, 0xBC3A4D
  LDI r7, 256
  LDI r3, 0x7C3E32
  LDI r1, 825
  LDI r9, 3270
  PUSH r1
  SUB r12, r15, r2
  SHR r5, r0, r13
  POP r1
  IKEY r13
  CMPI r13, 16
  JNZ r13, key_0
  IKEY r24
  CMPI r24, 0xCA4080
  JNZ r24, key_1
  SHR r7, r15, r16
  SHL r9, r21, r8
  CMPI r6, 4
  HALT
