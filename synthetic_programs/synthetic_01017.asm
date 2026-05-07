; mixed program
; initialization
  LDI r5, 2666
  LDI r13, 978
  LDI r4, 0xFD25D9
  IKEY r6
  CMPI r6, 111
  JNZ r6, key_0
  CALL func_1
func_1:
  AND r15, r10, r1
  OR r3, r7, r0
  MOD r10, r3, r4
  RET
  SHLI r0, r9, 0x7B4662
  SHLI r2, r4, 4
  CMPI r8, 32
  SHL r14, r11, r7
  SAR r11, r14, r0
  CMP r8, r12
  JZ r8, else_2
  ADD r0, r2, r7
  JMP endif_3
else_2:
  LDI r2, 255
  LDI r13, 0xF48413
  LDI r11, 0xDFD1BC
  WPIXEL
  LDI r11, 64
  FILL r11
  LDI r10, 3053
  LDI r9, 432
  LDI r3, 0x1CFCB0
  LDI r5, 0xE0BE09
  CIRCLE r10, r9, r3, r5
endif_3:
  HALT
