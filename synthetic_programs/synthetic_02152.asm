; mixed program
; initialization
  LDI r3, 0xBDB4AD
  LDI r2, 10
  LDI r15, 3341
  LDI r1, 2
; palette
  LDI r13, 0x305E
  LDI r6, 1
  LDI r7, 0xFF8800
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x0044FF
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xAAAAAA
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x00FF44
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xFF4400
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xFFAA00
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x888800
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xFFAA00
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x550077
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x000000
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xFF0000
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xFF00FF
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0xFF4400
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x0000CC
  STORE r13, r7
  ADD r13, r13, r6
  LDI r7, 0x0044FF
  STORE r13, r7
  ADD r13, r13, r6
  LDI r13, 0x00BF0A
  STORE r13, r2
  LOAD r12, r13
  LDI r13, 3390
  STORE r13, r6
  LOAD r1, r13
  IKEY r7
  CMPI r7, 0x00DE41
  JNZ r7, key_0
  CMPI r13, 2
  CMPI r5, 40
  LDI r13, 0xA1E86D
  LDI r13, 32
  LDI r0, 2303
  TEXT r13, r13, r0, "HELLO"
  LDI r0, 0xE42D1F
  STORE r0, r7
  LOAD r4, r0
  LDI r2, 256
  STORE r2, r8
  LOAD r9, r2
  CALL func_1
func_1:
  ADD r11, r13, r9
  SHR r10, r0, r15
  MOD r15, r13, r2
  RET
main_2:
  CMP r15, r1
  CMP r3, r6
  SUBI r14, r0, 0xB5498E
  IKEY r21
  CMPI r21, 4
  JNZ r21, key_3
  FRAME
  JMP main_2
