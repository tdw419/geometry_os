; mixed program
; initialization
  LDI r7, 64
  LDI r8, 675
  LDI r2, 255
  LDI r6, 4
  LDI r5, 0x38E493
  LDI r4, 575
  CALL func_0
func_0:
  ADD r3, r0, r15
  SHL r11, r12, r2
  MOD r6, r11, r14
  XOR r0, r4, r9
  RET
  CMP r2, r1
  JNZ r2, else_1
  OR r12, r7, r14
  SHR r12, r0, r6
  ADD r1, r14, r24
  ADD r10, r14, r20
  JMP endif_2
else_1:
  LDI r11, 16
  LDI r9, 0x2C8AD1
  LDI r0, 0x084593
  LDI r10, 0xC90FD5
  LDI r2, 255
  RECTF r11, r9, r0, r10, r2
  LDI r8, 3669
  LDI r8, 1
  LDI r12, 0
  LDI r8, 0x09429D
  CIRCLE r8, r8, r12, r8
  LDI r30, 0xD821E1
  LDI r2, 4
  LDI r28, 255
  PSETI
endif_2:
  DIV r11, r12, r8
  LDI r8, 0xD9F6C3
  LDI r4, 2
  LDI r9, 2523
  LDI r13, 0
  CIRCLE r8, r4, r9, r13
  SAR r7, r3, r12
  SHR r14, r2, r11
  SHLI r1, r6, 0xC1F9F2
  LDI r6, 0xC25888
  STORE r6, r13
  LOAD r5, r6
  LDI r14, 0x6C251B
  STORE r14, r9
  LOAD r2, r14
  LDI r11, 2042
  STORE r11, r13
  LOAD r6, r11
  LDI r13, 0xE0FD17
  STORE r13, r0
  LOAD r14, r13
  LDI r3, 0x48E7CC
  STORE r3, r15
  LOAD r24, r3
  MOD r4, r6, r15
main_3:
  XOR r2, r0, r10
  SHLI r6, r10, 0
  SHL r12, r6, r15
  SHR r0, r13, r10
  SHR r9, r13, r3
  SHL r5, r10, r11
  LDI r12, 2583
  LDI r23, 0x7DE543
  LDI r11, 2910
  WPIXEL
  LDI r4, 3255
  LDI r11, 10
  LDI r12, 256
  LDI r7, 3636
  LDI r8, 3241
  RECTF r4, r11, r12, r7, r8
  FRAME
  JMP main_3
