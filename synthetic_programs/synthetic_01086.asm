; mixed program
; initialization
  LDI r3, 3848
  LDI r13, 0xF157DB
  LDI r0, 256
  LDI r5, 2152
  LDI r15, 3082
  LDI r7, 2594
  LDI r12, 128
  PUSH r5
  SHR r0, r24, r5
  XOR r5, r3, r11
  XOR r7, r4, r12
  OR r7, r9, r1
  XOR r12, r5, r14
  POP r5
  IKEY r3
  CMPI r3, 0
  JNZ r3, key_0
  LDI r12, 0x8F94AA
  LDI r23, 16
  LDI r8, 0xC2C8A7
  PSETI
  CALL func_1
func_1:
  SHL r2, r8, r12
  AND r13, r9, r6
  OR r8, r18, r14
  XOR r8, r14, r9
  MOD r3, r8, r10
  ADD r7, r14, r17
  RET
  LDI r8, 24
loop_2:
  SHL r10, r7, r11
  ANDI r6, r9, 159
  SUBI r5, r22, 251
  LDI r6, 0xDB4B3F
  LDI r6, 32
  LDI r2, 2
  LDI r7, 3488
  LDI r15, 16
  RECTF r6, r6, r2, r7, r15
  LDI r5, 1
  SUB r8, r8, r5
  JNZ r8, loop_2
main_3:
  LDI r9, 786
  FILL r9
  AND r8, r7, r11
  CMP r11, r5
  LDI r4, 1282
  LDI r6, 578
  LDI r13, 0x4DF548
  LDI r3, 2107
  LDI r1, 8
  RECTF r4, r6, r13, r3, r1
  FRAME
  JMP main_3
