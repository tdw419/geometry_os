; mixed program
; initialization
  LDI r2, 2
  LDI r9, 1717
  LDI r10, 480
  LDI r14, 1205
  LDI r1, 0xF71E3E
; palette
  LDI r1, 0x50F6
  LDI r10, 1
  LDI r7, 0xFFFFFF
  STORE r1, r7
  ADD r1, r1, r10
  LDI r7, 0xFFFFFF
  STORE r1, r7
  ADD r1, r1, r10
  LDI r7, 0x444444
  STORE r1, r7
  ADD r1, r1, r10
  LDI r7, 0xFFFFFF
  STORE r1, r7
  ADD r1, r1, r10
  LDI r7, 0x0044FF
  STORE r1, r7
  ADD r1, r1, r10
  OR r13, r5, r3
  CMP r8, r15
  JNZ r8, else_0
  DIV r7, r13, r15
  AND r13, r12, r10
  AND r3, r8, r12
  JMP endif_1
else_0:
  LDI r13, 256
  LDI r10, 3926
  LDI r15, 3289
  PSETI
  LDI r8, 0x6A288D
  LDI r6, 32
  LDI r15, 0x045B94
  PSET r8, r6, r15
  LDI r12, 0x54E9AC
  LDI r8, 3896
  LDI r8, 0xD2E2AB
  WPIXEL
endif_1:
  CMP r14, r13
  JZ r14, else_2
  SUB r6, r13, r9
  JMP endif_3
else_2:
  LDI r10, 255
  FILL r10
  LDI r15, 2029
  LDI r11, 0x4595D0
  LDI r5, 0x6CC113
  PSETI
  LDI r9, 57
  LDI r14, 2
  LDI r2, 2
  LDI r3, 0x8F231D
  LDI r7, 4
  LINE r9, r14, r2, r3, r7
  LDI r9, 0x311221
  LDI r11, 128
  LDI r0, 0x367CA5
  PSETI
endif_3:
  LDI r0, 0x2C2EFD
loop_4:
  LDI r15, 768
  LDI r3, 16
  LDI r15, 4
  PSETI
  SUBI r14, r12, 245
  SUB r15, r4, r11
  LDI r11, 1
  SUB r0, r0, r11
  JNZ r0, loop_4
  AND r6, r4, r10
  XOR r4, r13, r7
  OR r11, r0, r13
  XOR r0, r12, r8
  LDI r11, 20x701C0x701C7
  STORE r11, r7
  LOAD r1, r11
  LDI r12, 0
  STORE r12, r11
  LOAD r7, r12
  LDI r12, 0x11DCE3
  STORE r12, r1
  LOAD r3, r12
  LDI r19, 32
  STORE r19, r4
  LOAD r11, r19
  LDI r0, 0xEAD1E8
  STORE r0, r1
  LOAD r7, r0
  HALT
