; mixed program
; initialization
  LDI r8, 0x982DA1
  LDI r11, 1918
  LDI r1, 8
  LDI r10, 1664
  LDI r13, 2345
  LDI r28, 0xCDD008
  LDI r9, 2783
  CMP r6, r26
  PUSH r5
  DIV r8, r30, r5
  DIV r12, r6, r9
  DIV r5, r29, r9
  DIV r6, r11, r3
  POP r5
  CMP r9, r2
  SHR r8, r17, r6
  SHLI r2, r0, 0x92ED01
  SHLI r1, r4, 0x76BCC0
  LDI r3, 0x9EAEF4
  FILL r3
  LDI r5, 24
loop_0:
  DIV r3, r11, r9
  SUBI r1, r8, 256
  SHL r26, r3, r15
  MUL r10, r2, r30
  LDI r3, 1
  SUB r5, r5, r3
  JNZ r5, loop_0
  LDI r10, 0x1A3F38
  LDI r8, 915
  LDI r1, 2456
  PSETI
  HALT
