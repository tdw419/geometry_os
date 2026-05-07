; mixed program
; initialization
  LDI r1, 241
  LDI r4, 410
  LDI r12, 256
  LDI r26, 0x747F9B
  LDI r2, 0x83BFB2
  CMPI r14, 256
  PUSH r10
  MOD r1, r3, r9
  SHR r3, r12, r1
  DIV r10, r6, r12
  ADD r10, r12, r7
  ADD r10, r2, r1
  POP r10
  CMP r7, r0
  JZ r7, else_0
  AND r7, r0, r3
  SHR r7, r5, r13
  JMP endif_1
else_0:
  LDI r2, 2282
  LDI r15, 3745
  LDI r12, 10
  PSETI
endif_1:
main_2:
  IKEY r15
  CMPI r15, 16
  JNZ r15, key_3
  AND r13, r15, r3
  OR r13, r19, r11
  XOR r5, r0, r14
  LDI r2, 32
  LDI r9, 0xD9F225
  LDI r9, 2
  LDI r2, 539
  CIRCLE r2, r9, r9, r2
  FRAME
  JMP main_2
