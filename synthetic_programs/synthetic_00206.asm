; mixed program
; initialization
  LDI r3, 2800
  LDI r7, 0x3B4FED
  LDI r0, 64
  LDI r8, 3165
  LDI r9, 1742
  LDI r6, 0xB51685
  LDI r12, 0xF29614
  LDI r4, 3869
  OR r6, r14, r7
  AND r7, r9, r12
  OR r12, r5, r14
  OR r2, r1, r12
  CMP r1, r12
  JNZ r1, else_0
  SHR r5, r12, r9
  ADD r14, r12, r9
  OR r8, r2, r7
  JMP endif_1
else_0:
  LDI r1, 32
  LDI r2, 1817
  LDI r10, 4
  WPIXEL
  LDI r1, 1
  LDI r13, 2277
  LDI r5, 8
  WPIXEL
  LDI r11, 3667
  FILL r11
  LDI r7, 3335
  LDI r26, 128
  LDI r31, 4
  PSET r7, r26, r31
endif_1:
  PUSH r0
  PUSH r1
  XOR r5, r12, r22
  SHR r15, r14, r9
  SHR r4, r15, r6
  OR r12, r7, r4
  POP r1
  POP r0
  HALT
