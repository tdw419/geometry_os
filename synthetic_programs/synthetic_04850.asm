; mixed program
; initialization
  LDI r0, 0x8D3F6A
  LDI r28, 64
  LDI r11, 8
; palette
  LDI r11, 0x5004
  LDI r5, 1
  LDI r2, 0xFFFFFF
  STORE r11, r2
  ADD r11, r11, r5
  LDI r2, 0x000000
  STORE r11, r2
  ADD r11, r11, r5
  LDI r2, 0xAAFF00
  STORE r11, r2
  ADD r11, r11, r5
  LDI r2, 0x00AAFF
  STORE r11, r2
  ADD r11, r11, r5
  XOR r9, r0, r5
  PUSH r15
  PUSH r15
  PUSH r0
  PUSH r12
  SHL r8, r6, r30
  ADD r4, r3, r5
  AND r7, r5, r9
  XOR r7, r8, r6
  POP r12
  POP r0
  POP r15
  POP r15
  AND r3, r8, r12
  AND r12, r15, r9
  XOR r1, r11, r3
  OR r0, r3, r1
  AND r7, r10, r14
  XOR r13, r8, r5
  AND r7, r11, r5
  XOR r1, r6, r7
  IKEY r7
  CMPI r7, 32
  JNZ r7, key_0
  XOR r1, r5, r15
  HALT
