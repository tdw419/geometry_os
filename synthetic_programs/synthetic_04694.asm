; mixed program
; initialization
  LDI r6, 0xDC4A5B
  LDI r14, 0x751781
  LDI r28, 0x68BD3F
  LDI r7, 0x8DF922
  LDI r4, 10
  LDI r12, 1498
  LDI r8, 0x1145C3
  LDI r3, 815
  SHLI r2, r3, 0x1ACCD1
  SHR r27, r2, r10
  SHLI r11, r9, 4
  SHLI r0, r7, 2
  LDI r3, 12
loop_0:
  SUBI r2, r3, 8
  XOR r1, r3, r11
  AND r8, r2, r7
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_0
  HALT
