; mixed program
; initialization
  LDI r3, 256
  LDI r15, 0x938AF1
  IKEY r11
  CMPI r11, 0x16F636
  JNZ r11, key_0
  XOR r1, r2, r7
  XOR r14, r6, r1
  XOR r7, r10, r12
  OR r8, r3, r9
  PUSH r14
  PUSH r5
  PUSH r7
  ADD r2, r0, r15
  MOD r0, r7, r3
  POP r7
  POP r5
  POP r14
  SHL r5, r11, r7
  IKEY r6
  CMPI r6, 0xDBF01C
  JNZ r6, key_1
  SHL r7, r12, r5
  SHLI r1, r14, 5
  CMP r10, r13
  HALT
