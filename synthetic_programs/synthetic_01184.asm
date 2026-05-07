; conditional logic
; initialization
  LDI r12, 0x0304FA
  LDI r4, 2876
  CMP r5, r6
  JNZ r5, else_0
  OR r11, r4, r18
  SUB r1, r9, r13
  JMP endif_1
else_0:
  LDI r14, 64
  FILL r14
  LDI r11, 0xCFD511
  FILL r11
  LDI r5, 255
  LDI r4, 4
  LDI r11, 2
  LDI r0, 3142
  LDI r2, 0xA830D0
  RECTF r5, r4, r11, r0, r2
endif_1:
  HALT
