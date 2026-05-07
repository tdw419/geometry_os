; conditional logic
; initialization
  LDI r5, 1083
  LDI r2, 1006
  LDI r14, 71
  LDI r6, 0xFDADEF
  LDI r1, 64
  LDI r9, 0x3F8D7F
  LDI r7, 256
  CMP r4, r15
  JNZ r4, else_0
  AND r14, r27, r15
  MOD r14, r12, r6
  MUL r9, r5, r13
  JMP endif_1
else_0:
  LDI r0, 255
  LDI r12, 0xFC5AEF
  LDI r6, 2
  WPIXEL
endif_1:
  CMP r0, r5
  JZ r0, else_2
  OR r4, r5, r12
  ADD r6, r13, r5
  SHL r12, r11, r1
  DIV r0, r17, r1
  JMP endif_3
else_2:
  LDI r15, 0xBD6580
  LDI r1, 0x969180
  LDI r7, 2798
  LDI r1, 0x744CEF
  LDI r7, 64
  LINE r15, r1, r7, r1, r7
endif_3:
  CMP r9, r13
  JZ r9, else_4
  SHR r9, r12, r2
  JMP endif_5
else_4:
  LDI r5, 32
  FILL r5
  LDI r29, 32
  FILL r29
endif_5:
  HALT
