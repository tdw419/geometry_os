; conditional logic
; initialization
  LDI r14, 592
  LDI r9, 1269
  LDI r1, 3843
  LDI r13, 128
  LDI r11, 0
  CMP r13, r15
  JZ r13, else_0
  MOD r9, r1, r0
  JMP endif_1
else_0:
  LDI r3, 16
  LDI r10, 0xE3D4A7
  LDI r4, 2
  LDI r3, 1
  LDI r5, 64
  RECTF r3, r10, r4, r3, r5
  LDI r9, 255
  FILL r9
  LDI r12, 0x20BC37
  LDI r7, 10
  LDI r15, 1405
  LDI r2, 0xF0389C
  LDI r11, 256
  RECTF r12, r7, r15, r2, r11
endif_1:
  CMP r15, r3
  JZ r15, else_2
  MUL r8, r13, r22
  MOD r19, r4, r14
  JMP endif_3
else_2:
  LDI r1, 3242
  LDI r15, 219
  LDI r15, 8
  WPIXEL
  LDI r6, 1231
  LDI r10, 1778
  LDI r10, 8
  PSETI
  LDI r12, 3210
  LDI r4, 2
  LDI r18, 1951
  PSET r12, r4, r18
  LDI r2, 0x80FAF0
  LDI r11, 32
  LDI r6, 0x9B53D7
  PSETI
endif_3:
  CMP r0, r1
  JNZ r0, else_4
  ADD r0, r6, r5
  JMP endif_5
else_4:
  LDI r14, 2345
  LDI r4, 0x08D5FD
  LDI r12, 151
  LDI r9, 1
  LDI r0, 3919
  LINE r14, r4, r12, r9, r0
  LDI r7, 0x39D4E6
  LDI r1, 200
  LDI r7, 32
  PSETI
  LDI r2, 255
  LDI r0, 48
  LDI r6, 0xAE49A5
  WPIXEL
endif_5:
  HALT
