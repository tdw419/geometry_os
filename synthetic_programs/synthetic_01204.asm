; mixed program
; initialization
  LDI r0, 0xF98CE5
  LDI r15, 0xE1EB75
  LDI r11, 1
  LDI r4, 1237
  LDI r12, 0x72C6A1
  LDI r7, 0x8C1FA4
  CMPI r5, 0xAD2FE0
  OR r14, r7, r11
  CMP r9, r10
  JNZ r9, else_0
  DIV r5, r6, r11
  ADD r9, r3, r5
  MOD r10, r6, r12
  JMP endif_1
else_0:
  LDI r7, 0xA72FDE
  LDI r5, 16
  LDI r11, 0x6851AB
  LDI r12, 0xAD6294
  LDI r5, 256
  RECTF r7, r5, r11, r12, r5
endif_1:
  OR r2, r9, r7
  AND r11, r5, r7
  AND r9, r10, r14
  SHLI r13, r12, 256
  SHR r12, r10, r1
  SHL r6, r4, r13
  HALT
