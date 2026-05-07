; mixed program
; initialization
  LDI r12, 8
  LDI r3, 1
; palette
  LDI r7, 0x2452
  LDI r15, 1
  LDI r8, 0x880088
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x008888
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x008888
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x00FF44
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x00FF44
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x0044FF
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x0044FF
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x00FFFF
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x0044FF
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0xFF0000
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0xFFFF00
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0xFF4400
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0xFF0000
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x00AAFF
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0xFFFF00
  STORE r7, r8
  ADD r7, r7, r15
  LDI r8, 0x0000CC
  STORE r7, r8
  ADD r7, r7, r15
  IKEY r13
  CMPI r13, 0x6DA17B
  JNZ r13, key_0
  LDI r4, 1868
  LDI r8, 2698
  LDI r2, 0
  DRAWTEXT r4, r8, r2, "WORLD"
  CALL func_1
func_1:
  MOD r8, r13, r5
  SUB r25, r10, r0
  OR r9, r10, r4
  RET
  MUL r14, r8, r13
  LDI r15, 1495
  LDI r6, 2
  LDI r10, 0xF9BCF8
  WPIXEL
  IKEY r13
  CMPI r13, 155
  JNZ r13, key_2
main_3:
  AND r13, r2, r5
  OR r0, r1, r10
  XOR r1, r10, r2
  OR r10, r16, r14
  AND r15, r8, r0
  AND r9, r14, r0
  AND r8, r9, r12
  AND r13, r4, r7
  LDI r3, 1049
  LDI r9, 4
  LDI r27, 16
  WPIXEL
  IKEY r12
  CMPI r12, 229
  JNZ r12, key_4
  FRAME
  JMP main_3
