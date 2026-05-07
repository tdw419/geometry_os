; mixed program
; initialization
  LDI r10, 2
  LDI r2, 1667
  LDI r4, 10
  LDI r0, 2277
  LDI r21, 0x5338E0
  LDI r2, 2182
  WPIXEL
  CMP r5, r14
  JNZ r5, else_0
  SHL r11, r13, r9
  MUL r6, r10, r13
  SHL r3, r5, r9
  JMP endif_1
else_0:
  LDI r13, 2669
  LDI r8, 0xBAE508
  LDI r5, 0x4B52C3
  WPIXEL
  LDI r1, 3978
  LDI r12, 0xBF445B
  LDI r12, 8
  LDI r11, 1879
  CIRCLE r1, r12, r12, r11
endif_1:
  SHLI r9, r10, 64
  SHR r9, r25, r15
  SAR r16, r15, r14
  AND r8, r5, r3
  AND r1, r14, r13
  CALL func_2
func_2:
  ADD r12, r7, r3
  MOD r14, r6, r8
  DIV r11, r25, r9
  MOD r2, r0, r11
  RET
  HALT
