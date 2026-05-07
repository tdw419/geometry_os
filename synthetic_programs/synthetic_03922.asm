; mixed program
; initialization
  LDI r8, 32
  LDI r6, 0x06B587
; palette
  LDI r7, 0x60E5
  LDI r4, 1
  LDI r13, 0x444444
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0x0000CC
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0x888800
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0xFFFF00
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0x888800
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0xFFEE00
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0x880088
  STORE r7, r13
  ADD r7, r7, r4
  LDI r13, 0x0000CC
  STORE r7, r13
  ADD r7, r7, r4
  OR r2, r27, r5
  CALL func_0
func_0:
  SHR r0, r10, r11
  MUL r26, r15, r14
  SHR r2, r1, r11
  XOR r7, r9, r0
  XOR r4, r3, r14
  SHR r13, r9, r26
  RET
  CMPI r9, 4
  LDI r7, 8
  LDI r19, 2
  LDI r13, 0x47E8F5
  TEXT r7, r19, r13, "HELLO"
  LDI r15, 1
  LDI r12, 1183
  LDI r13, 0xF4C0DA
  LDI r22, 64
  LDI r10, 0x59D365
  LINE r15, r12, r13, r22, r10
  CMPI r6, 221
  OR r9, r12, r14
  AND r5, r4, r7
  IKEY r7
  CMPI r7, 256
  JNZ r7, key_1
main_2:
  IKEY r4
  CMPI r4, 4
  JNZ r4, key_3
  IKEY r14
  CMPI r14, 255
  JNZ r14, key_4
  CMPI r9, r11, 0xDA15FF
  LDI r1, 128
  LDI r7, 4
  LDI r9, 0x317A73
  TEXT r1, r7, r9, "HELLO"
  FRAME
  JMP main_2
