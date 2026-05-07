; mixed program
; initialization
  LDI r12, 4
  LDI r4, 8
  LDI r5, 1546
  LDI r1, 0x11536B
  LDI r6, 3970
  LDI r2, 128
  LDI r10, 0x81D319
  CMP r1, r11
  JZ r1, else_0
  ADD r13, r5, r3
  JMP endif_1
else_0:
  LDI r1, 3058
  LDI r11, 0x842833
  LDI r4, 3137
  WPIXEL
  LDI r5, 0xEE1814
  LDI r0, 3095
  LDI r7, 4
  WPIXEL
  LDI r1, 0x819A7B
  FILL r1
endif_1:
  CALL func_2
func_2:
  MOD r6, r9, r5
  MUL r6, r2, r5
  RET
  IKEY r6
  CMPI r6, 195
  JNZ r6, key_3
  IKEY r4
  CMPI r4, 70
  JNZ r4, key_4
  IKEY r11
  CMPI r11, 40
  JNZ r11, key_5
  CMP r7, r13
  AND r0, r2, r5
  AND r9, r12, r0
  OR r8, r4, r15
  HALT
