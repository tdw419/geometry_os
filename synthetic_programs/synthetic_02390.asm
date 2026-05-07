; mixed program
; initialization
  LDI r13, 10
  LDI r26, 0x6B0660
  LDI r11, 0xAE6EEF
  LDI r27, 3372
  LDI r4, 1878
  LDI r8, 64
  LDI r3, 1122
  LDI r6, 1405
  LDI r15, 847
  LDI r0, 406
  LDI r4, 0xD9CB3E
  TEXT r15, r0, r4, "HELLO"
  CMP r4, r13
  JZ r4, else_0
  SHR r6, r9, r15
  MOD r11, r5, r16
  JMP endif_1
else_0:
  LDI r5, 3986
  LDI r11, 4
  LDI r18, 0
  LDI r14, 4058
  LDI r4, 1927
  RECTF r5, r11, r18, r14, r4
  LDI r11, 749
  LDI r5, 16
  LDI r0, 0x5A01EE
  LDI r2, 1639
  LDI r7, 128
  LINE r11, r5, r0, r2, r7
  LDI r5, 3707
  LDI r7, 3610
  LDI r9, 0x9A8AA4
  LDI r7, 0x89D8BA
  LDI r9, 0x74FC30
  RECTF r5, r7, r9, r7, r9
endif_1:
  MOD r13, r15, r14
  LDI r7, 122
  FILL r7
  SHR r8, r7, r15
  SAR r8, r5, r11
  SHL r7, r13, r3
  SHL r2, r3, r15
  SHR r3, r10, r1
  LDI r3, 0xA5AABC
  STORE r3, r9
  LOAD r8, r3
  LDI r2, 218
  STORE r2, r6
  LOAD r13, r2
  LDI r6, 1
  STORE r6, r29
  LOAD r1, r6
  HALT
