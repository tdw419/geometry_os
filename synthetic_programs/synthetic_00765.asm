; mixed program
; initialization
  LDI r10, 2
  LDI r14, 10
  LDI r5, 730
  LDI r12, 4
  LDI r11, 0x0CE9E3
  AND r4, r13, r2
  XOR r6, r5, r7
  AND r1, r0, r6
  AND r3, r5, r9
  LDI r7, 16
  LDI r14, 0
  LDI r10, 0x3FC44D
  TEXT r7, r14, r10, "HELLO"
  CMP r4, r11
  JNZ r4, else_0
  MOD r7, r6, r3
  MOD r11, r8, r31
  SHR r13, r14, r1
  JMP endif_1
else_0:
  LDI r4, 2384
  LDI r6, 617
  LDI r9, 1308
  WPIXEL
  LDI r2, 0
  LDI r7, 2603
  LDI r6, 0xC05C08
  PSET r2, r7, r6
  LDI r8, 147
  LDI r4, 0x33E240
  LDI r2, 255
  PSET r8, r4, r2
  LDI r12, 0x21CE38
  LDI r2, 0xEF6ED4
  LDI r25, 0x90AD93
  PSETI
endif_1:
main_2:
  CMP r1, r3
  SUB r3, r1, r13
  XOR r8, r6, r15
  XOR r31, r15, r12
  OR r2, r13, r10
  FRAME
  JMP main_2
