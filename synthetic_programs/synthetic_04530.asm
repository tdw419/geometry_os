; mixed program
; initialization
  LDI r15, 2142
  LDI r0, 128
  LDI r11, 339
  LDI r10, 0xC8D314
  LDI r13, 3483
  LDI r3, 2949
; palette
  LDI r3, 0x2213
  LDI r1, 1
  LDI r12, 0x550077
  STORE r3, r12
  ADD r3, r3, r1
  LDI r12, 0xFFFF00
  STORE r3, r12
  ADD r3, r3, r1
  LDI r12, 0xFFEE00
  STORE r3, r12
  ADD r3, r3, r1
  LDI r12, 0x550077
  STORE r3, r12
  ADD r3, r3, r1
  LDI r13, 0x35D56B
loop_0:
  LDI r9, 16
  LDI r8, 0xA0F1CD
  LDI r8, 2
  WPIXEL
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_0
  LDI r1, 684
  STORE r1, r10
  LOAD r9, r1
  LDI r14, 8
  STORE r14, r5
  LOAD r3, r14
  LDI r10, 32
  STORE r10, r9
  LOAD r0, r10
  LDI r1, 3945
  STORE r1, r7
  LOAD r6, r1
  LDI r7, 2
  STORE r7, r8
  LOAD r12, r7
  LDI r13, 64
loop_1:
  LDI r4, 0x962638
  LDI r3, 255
  LDI r3, 1672
  PSETI
  CMPI r5, r4, 10
  LDI r10, 1
  SUB r13, r13, r10
  JNZ r13, loop_1
  CALL func_2
func_2:
  OR r7, r6, r13
  SUB r8, r28, r7
  SHL r10, r11, r2
  RET
  IKEY r9
  CMPI r9, 10
  JNZ r9, key_3
main_4:
  IKEY r7
  CMPI r7, 0x51C85D
  JNZ r7, key_5
  IKEY r2
  CMPI r2, 1
  JNZ r2, key_6
  DIV r8, r4, r14
  AND r8, r2, r4
  XOR r12, r15, r14
  OR r0, r12, r5
  AND r25, r2, r10
  CMPI r13, 32
  DIV r9, r12, r0
  FRAME
  JMP main_4
