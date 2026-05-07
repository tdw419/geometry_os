; mixed program
; initialization
  LDI r3, 0xA7CD92
  LDI r4, 0xEC0D3E
  LDI r2, 4064
  LDI r12, 0xE136BE
  LDI r11, 2009
  LDI r7, 0
  LDI r10, 3524
  LDI r9, 255
  SHLI r11, r3, 0x94921F
  SHR r1, r7, r5
  AND r13, r28, r10
  AND r2, r8, r13
  LDI r14, 4
  FILL r14
  LDI r8, 0xBF21D4
  STORE r8, r6
  LOAD r4, r8
  LDI r6, 839
  STORE r6, r7
  LOAD r13, r6
  LDI r1, 256
  STORE r1, r8
  LOAD r14, r1
  LDI r10, 256
  STORE r10, r15
  LOAD r8, r10
  CMP r13, r3
  JNZ r13, else_0
  MOD r1, r6, r2
  OR r15, r11, r23
  DIV r9, r14, r8
  SUB r0, r3, r11
  JMP endif_1
else_0:
  LDI r13, 2
  LDI r11, 0x556E82
  LDI r24, 0x573CCA
  LDI r7, 2917
  LDI r4, 0x8F1A6C
  LINE r13, r11, r24, r7, r4
  LDI r15, 2229
  FILL r15
endif_1:
  LDI r8, 616
  LDI r15, 255
  LDI r4, 3814
  LDI r15, 0xC79088
  LDI r29, 0x5ADB85
  LINE r8, r15, r4, r15, r29
main_2:
  SHR r8, r6, r3
  SHL r1, r9, r13
  SHR r15, r12, r5
  LDI r1, 1936
  LDI r13, 10
  LDI r0, 0xEE0056
  LDI r10, 0x310A09
  LDI r4, 100
  RECTF r1, r13, r0, r10, r4
  LDI r14, 0x11B80B
  LDI r5, 0x37E36F
  LDI r12, 3871
  WPIXEL
  SHR r5, r8, r3
  FRAME
  JMP main_2
