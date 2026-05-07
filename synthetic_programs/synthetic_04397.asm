; drawing loop program
; initialization
  LDI r4, 3148
  LDI r3, 2632
  LDI r13, 0
main_0:
  LDI r13, 1
  LDI r9, 2
  LDI r10, 3850
  TEXT r13, r9, r10, "HELLO"
  ANDI r11, r13, 0
  SHR r7, r13, r1
  SHL r15, r2, r25
  SHLI r15, r6, 3
  SHR r2, r0, r3
  CMPI r9, 0xDA8E63
  IKEY r8
  CMPI r8, 178
  JNZ r8, key_1
  MUL r7, r0, r13
  FRAME
  JMP main_0
