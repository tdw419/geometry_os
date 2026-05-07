; conditional logic
; initialization
  LDI r9, 2
  LDI r12, 2
  CMP r0, r11
  JZ r0, else_0
  MOD r0, r15, r7
  MOD r4, r9, r3
  SUB r3, r9, r5
  SHL r11, r6, r27
  JMP endif_1
else_0:
  LDI r9, 2
  LDI r9, 0x263A43
  LDI r7, 64
  WPIXEL
endif_1:
  HALT
