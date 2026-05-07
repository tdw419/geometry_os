; mixed program
; initialization
  LDI r8, 1600
  LDI r9, 0x22AF6C
  LDI r6, 256
  LDI r4, 32
  LDI r15, 0x7373CC
  LDI r0, 0xF43FFE
  LDI r7, 219
  LDI r22, 64
  MOD r14, r12, r3
  PUSH r9
  PUSH r6
  ADD r8, r1, r31
  SHR r13, r8, r6
  OR r6, r0, r10
  POP r6
  POP r9
  PUSH r2
  PUSH r5
  PUSH r0
  XOR r5, r0, r4
  SHR r0, r7, r17
  OR r5, r12, r6
  SUB r5, r13, r11
  SHL r6, r10, r15
  POP r0
  POP r5
  POP r2
  IKEY r7
  CMPI r7, 0xCBFF5C
  JNZ r7, key_0
  HALT
