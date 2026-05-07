; mixed program
; initialization
  LDI r27, 1785
  LDI r6, 0xF87847
  LDI r0, 2837
  LDI r3, 128
  LDI r2, 64
  LDI r8, 0x6D9D25
  LDI r15, 2183
  LDI r13, 10
  AND r11, r12, r4
  AND r6, r9, r5
  OR r9, r8, r0
  XOR r10, r9, r8
  IKEY r9
  CMPI r9, 4
  JNZ r9, key_0
  LDI r8, 0x70DA1C
  LDI r4, 349
  LDI r10, 8
  LDI r9, 4
  CIRCLE r8, r4, r10, r9
  CMP r4, r14
  JNZ r4, else_1
  SUB r4, r5, r15
  SHL r10, r15, r6
  JMP endif_2
else_1:
  LDI r0, 1419
  LDI r1, 0xC9E3E4
  LDI r10, 0
  PSETI
  LDI r6, 0x43C1AD
  LDI r3, 128
  LDI r12, 1859
  PSET r6, r3, r12
  LDI r15, 951
  LDI r6, 32
  LDI r14, 1
  LDI r15, 0
  LDI r3, 1885
  LINE r15, r6, r14, r15, r3
endif_2:
  IKEY r10
  CMPI r10, 128
  JNZ r10, key_3
  IKEY r12
  CMPI r12, 0x375E19
  JNZ r12, key_4
  PUSH r15
  PUSH r5
  ADD r12, r13, r9
  XOR r5, r14, r9
  DIV r3, r8, r11
  OR r2, r14, r12
  MOD r6, r10, r14
  POP r5
  POP r15
main_5:
  SHLI r8, r2, 256
  SHR r15, r24, r0
  SHL r15, r18, r1
  SHLI r10, r2, 0xB804EB
  LDI r1, 16
  LDI r0, 32
  LDI r13, 2209
  TEXT r1, r0, r13, "HELLO"
  AND r0, r13, r2
  OR r5, r12, r1
  OR r13, r6, r5
  AND r3, r24, r8
  CMPI r11, 2
  IKEY r2
  CMPI r2, 0x098D00
  JNZ r2, key_6
  FRAME
  JMP main_5
