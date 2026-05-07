; mixed program
; initialization
  LDI r15, 0x75FF12
  LDI r29, 10
  LDI r4, 0x4E82E5
  LDI r8, 128
  LDI r23, 0x2097C3
  LDI r3, 1313
  XOR r13, r12, r3
  AND r0, r5, r11
  XOR r11, r0, r1
  PUSH r14
  PUSH r13
  PUSH r6
  MOD r9, r3, r8
  SUB r14, r13, r11
  SHR r11, r1, r7
  MOD r15, r3, r1
  POP r6
  POP r13
  POP r14
  PUSH r15
  PUSH r3
  PUSH r15
  PUSH r11
  AND r4, r15, r20
  SHR r4, r7, r14
  SHR r0, r15, r1
  POP r11
  POP r15
  POP r3
  POP r15
  CMP r2, r13
  JNZ r2, else_0
  XOR r13, r3, r12
  JMP endif_1
else_0:
  LDI r15, 0x8242CD
  LDI r6, 1965
  LDI r0, 2413
  PSETI
  LDI r13, 3672
  LDI r2, 0x5D5189
  LDI r13, 777
  PSETI
  LDI r11, 0x3D6AB7
  LDI r9, 10
  LDI r0, 0
  WPIXEL
  LDI r6, 0x6F8268
  LDI r1, 0x6846B6
  LDI r23, 0x7197A8
  PSET r6, r1, r23
endif_1:
  LDI r12, 0
loop_2:
  AND r15, r7, r12
  LDI r14, 1
  SUB r12, r12, r14
  JNZ r12, loop_2
  LDI r1, 1729
  LDI r2, 2405
  LDI r9, 582
  DRAWTEXT r1, r2, r9, "WORLD"
  LDI r15, 3644
  STORE r15, r10
  LOAD r29, r15
  LDI r13, 3117
  STORE r13, r1
  LOAD r9, r13
  LDI r3, 0xBB88BC
  FILL r3
  HALT
