; conditional logic
; initialization
  LDI r11, 604
  LDI r9, 16
  LDI r6, 10
  CMP r7, r1
  JNZ r7, else_0
  XOR r5, r16, r6
  OR r1, r9, r2
  SHR r20, r11, r6
  JMP endif_1
else_0:
  LDI r10, 2090
  LDI r11, 255
  LDI r8, 0xFDCCB3
  LDI r5, 0x781E12
  LDI r8, 4
  RECTF r10, r11, r8, r5, r8
  LDI r3, 64
  LDI r14, 2869
  LDI r7, 2999
  LDI r6, 64
  LDI r18, 256
  LINE r3, r14, r7, r6, r18
endif_1:
  HALT
