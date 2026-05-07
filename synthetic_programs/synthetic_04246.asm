; mixed program
; initialization
  LDI r2, 193
  LDI r8, 0x3B7CE7
  LDI r13, 0x1CCB82
  LDI r11, 10
  LDI r6, 2
  CMP r12, r3
  JZ r12, else_0
  AND r1, r13, r7
  JMP endif_1
else_0:
  LDI r11, 4
  LDI r2, 1912
  LDI r13, 0xB81ECA
  WPIXEL
endif_1:
  OR r13, r11, r9
  SAR r11, r5, r3
  SHR r10, r6, r7
  HALT
