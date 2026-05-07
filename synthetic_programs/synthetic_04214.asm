; conditional logic
; initialization
  LDI r4, 161
  LDI r8, 270
  CMP r5, r0
  JZ r5, else_0
  XOR r5, r3, r15
  ADD r11, r19, r13
  JMP endif_1
else_0:
  LDI r8, 0x71BAF3
  LDI r6, 2049
  LDI r3, 4
  PSETI
  LDI r9, 0
  LDI r6, 0x905CEB
  LDI r0, 0x38E1E0
  WPIXEL
  LDI r9, 1881
  LDI r16, 16
  LDI r7, 0
  PSET r9, r16, r7
endif_1:
  CMP r15, r5
  JNZ r15, else_2
  MUL r12, r10, r13
  SHL r12, r11, r10
  XOR r11, r10, r4
  MUL r15, r2, r8
  JMP endif_3
else_2:
  LDI r15, 64
  FILL r15
  LDI r3, 1351
  LDI r27, 0x836665
  LDI r15, 16
  PSET r3, r27, r15
  LDI r1, 0x887AFA
  FILL r1
endif_3:
  CMP r11, r13
  JNZ r11, else_4
  SUB r3, r10, r9
  OR r9, r10, r11
  JMP endif_5
else_4:
  LDI r2, 0xFA066B
  FILL r2
endif_5:
  HALT
