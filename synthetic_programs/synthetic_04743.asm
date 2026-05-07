; mixed program
; initialization
  LDI r0, 1
  LDI r11, 193
  XOR r1, r24, r26
  AND r10, r8, r13
  PUSH r1
  PUSH r4
  PUSH r9
  MOD r2, r12, r10
  AND r9, r11, r2
  DIV r9, r13, r12
  POP r9
  POP r4
  POP r1
  PUSH r2
  PUSH r15
  PUSH r11
  ADD r13, r6, r15
  ADD r3, r0, r9
  SHR r9, r6, r28
  SHL r3, r0, r15
  POP r11
  POP r15
  POP r2
  LDI r5, 0xFA7FBE
  LDI r7, 1314
  LDI r14, 256
  LDI r0, 1642
  CIRCLE r5, r7, r14, r0
main_0:
  IKEY r2
  CMPI r2, 0
  JNZ r2, key_1
  CMP r14, r1
  LDI r10, 16
  LDI r0, 2020
  LDI r7, 0x2958E2
  LDI r4, 0xF42C09
  LDI r6, 2706
  RECTF r10, r0, r7, r4, r6
  SUB r11, r7, r12
  SHL r3, r2, r9
  SHL r9, r14, r13
  SHL r14, r8, r2
  FRAME
  JMP main_0
