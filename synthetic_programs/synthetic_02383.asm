; mixed program
; initialization
  LDI r2, 0
  LDI r3, 32
  LDI r17, 0x877DF8
  LDI r13, 0x8EBFB1
  LDI r10, 64
  LDI r6, 0x640C19
  LDI r7, 256
  LDI r8, 0x287653
  SAR r13, r4, r10
  SHR r13, r1, r0
  SHLI r1, r13, 0x651898
  SAR r1, r12, r2
  CMPI r12, 4
  MOD r20, r24, r8
  LDI r4, 874
  LDI r13, 416
  LDI r6, 1
  PSETI
  LDI r6, 538
  LDI r10, 0x30893F
  LDI r0, 4
  LDI r8, 0xD9AE06
  CIRCLE r6, r10, r0, r8
  XOR r0, r5, r1
  XOR r0, r10, r6
  LDI r14, 5
loop_0:
  LDI r30, 128
  LDI r15, 128
  LDI r13, 16
  PSET r30, r15, r13
  LDI r13, 1
  SUB r14, r14, r13
  JNZ r14, loop_0
  SHR r2, r13, r4
  SHR r19, r2, r9
  SHLI r9, r6, 0xE1E65F
main_1:
  SHL r3, r23, r9
  SHLI r0, r7, 0xD68EAB
  SHLI r7, r9, 7
  SHR r11, r4, r0
  LDI r7, 32
  LDI r3, 16
  LDI r3, 0xB0B706
  TEXT r7, r3, r3, "HELLO"
  FRAME
  JMP main_1
