; mixed program
; initialization
  LDI r13, 1089
  LDI r4, 0x7CEF9D
  LDI r14, 974
  LDI r15, 2
  LDI r0, 0xD4C383
; palette
  LDI r13, 0x5086
  LDI r15, 1
  LDI r2, 0x00FF00
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0xFFFF00
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0x8800FF
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0x888800
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0x0000CC
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0x00FF44
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0x0000FF
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0xFF0000
  STORE r13, r2
  ADD r13, r13, r15
  LDI r2, 0x000000
  STORE r13, r2
  ADD r13, r13, r15
  IKEY r3
  CMPI r3, 256
  JNZ r3, key_0
  LDI r15, 0xFF36CD
  LDI r2, 10
  LDI r13, 0x10E108
  LDI r11, 1449
  CIRCLE r15, r2, r13, r11
  IKEY r13
  CMPI r13, 85
  JNZ r13, key_1
  SHL r12, r13, r2
  SHL r1, r10, r13
  SHL r11, r3, r13
  SHR r10, r3, r5
  MOD r6, r1, r9
  IKEY r4
  CMPI r4, 0xAB7E2E
  JNZ r4, key_2
  CALL func_3
func_3:
  MOD r15, r3, r10
  DIV r13, r2, r3
  OR r7, r5, r1
  ADD r5, r4, r1
  MUL r3, r0, r4
  MOD r11, r9, r12
  RET
  CMP r5, r4
  JNZ r5, else_4
  SHR r15, r10, r1
  OR r1, r10, r9
  DIV r8, r13, r7
  SHR r2, r19, r4
  JMP endif_5
else_4:
  LDI r6, 0x4636A8
  LDI r3, 0x1D5917
  LDI r8, 2750
  PSETI
  LDI r5, 10
  LDI r3, 2
  LDI r5, 2
  LDI r2, 255
  LDI r24, 0x76D1FC
  LINE r5, r3, r5, r2, r24
  LDI r3, 332
  LDI r9, 0
  LDI r0, 3529
  WPIXEL
  LDI r9, 1
  LDI r3, 255
  LDI r8, 3033
  WPIXEL
endif_5:
main_6:
  SHR r2, r0, r7
  SHL r0, r10, r6
  CMP r2, r4
  LDI r12, 2387
  LDI r13, 2
  LDI r13, 2699
  PSETI
  LDI r1, 0x9D2624
  LDI r9, 0xEDB432
  LDI r2, 4
  PSETI
  FRAME
  JMP main_6
