; conditional logic
; initialization
  LDI r0, 255
  LDI r15, 2954
  CMP r11, r5
  JNZ r11, else_0
  SUB r4, r10, r0
  JMP endif_1
else_0:
  LDI r5, 506
  LDI r15, 0xA01D8C
  LDI r2, 1230
  PSETI
endif_1:
  HALT
