; mixed program
; initialization
  LDI r12, 3589
  LDI r15, 2414
  LDI r8, 2137
  LDI r10, 128
  CMP r11, r10
  JNZ r11, else_0
  SUB r5, r28, r4
  JMP endif_1
else_0:
  LDI r13, 2675
  FILL r13
endif_1:
  LDI r5, 0x902672
loop_2:
  CMPI r11, r9, 64
  LDI r19, 3549
  LDI r12, 0xC1FF76
  LDI r28, 128
  PSETI
  LDI r19, 256
  LDI r5, 32
  LDI r9, 8
  PSETI
  MOD r12, r13, r10
  LDI r1, 1
  SUB r5, r5, r1
  JNZ r5, loop_2
  CMP r6, r10
  XOR r15, r0, r11
  XOR r8, r5, r6
  AND r8, r12, r1
  OR r18, r8, r9
  SHL r7, r5, r3
  SAR r13, r14, r5
  PUSH r26
  PUSH r5
  PUSH r12
  PUSH r15
  OR r15, r21, r13
  MOD r4, r11, r14
  SUB r9, r8, r13
  SHR r11, r0, r3
  MOD r11, r5, r3
  POP r15
  POP r12
  POP r5
  POP r26
  XOR r9, r5, r4
  XOR r7, r8, r30
  OR r0, r12, r14
  HALT
