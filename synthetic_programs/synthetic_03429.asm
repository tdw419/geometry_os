; mixed program
; initialization
  LDI r9, 2
  LDI r2, 0xC78F5F
  LDI r12, 32
  SHLI r3, r6, 2
  SAR r0, r1, r7
  SAR r4, r10, r9
  SAR r3, r2, r14
  ADD r8, r10, r15
  LDI r7, 8
  STORE r7, r8
  LOAD r11, r7
  LDI r6, 2069
  STORE r6, r4
  LOAD r19, r6
  LDI r2, 960
  STORE r2, r12
  LOAD r3, r2
  XOR r5, r6, r8
  XOR r7, r5, r9
  LDI r8, 4
loop_0:
  ADDI r15, r30, 0xAE2AEB
  ADDI r6, r5, 0x6F4BE5
  LDI r11, 1
  SUB r8, r8, r11
  JNZ r8, loop_0
  HALT
