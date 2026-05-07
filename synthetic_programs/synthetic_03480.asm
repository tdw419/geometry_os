; conditional logic
; initialization
  LDI r3, 0xB68F99
  LDI r1, 10
  LDI r10, 256
  LDI r13, 16
  LDI r8, 128
  CMP r9, r0
  JZ r9, else_0
  MOD r10, r9, r1
  ADD r3, r27, r20
  DIV r3, r6, r5
  ADD r2, r11, r22
  JMP endif_1
else_0:
  LDI r2, 8
  LDI r0, 385
  LDI r0, 255
  LDI r0, 3231
  LDI r11, 1
  LINE r2, r0, r0, r0, r11
  LDI r11, 2
  LDI r7, 256
  LDI r9, 815
  WPIXEL
  LDI r14, 16
  FILL r14
endif_1:
  CMP r5, r0
  JZ r5, else_2
  SHR r11, r31, r12
  SHR r5, r15, r11
  SHL r15, r0, r14
  DIV r11, r13, r8
  JMP endif_3
else_2:
  LDI r3, 64
  LDI r6, 540
  LDI r10, 0xC67FF2
  PSETI
  LDI r4, 0x92DFFA
  LDI r11, 0x61D2FE
  LDI r15, 32
  WPIXEL
  LDI r1, 910
  LDI r6, 0xF5E870
  LDI r19, 0x2C3D5A
  LDI r8, 2480
  LDI r5, 8
  RECTF r1, r6, r19, r8, r5
  LDI r10, 3772
  FILL r10
endif_3:
  HALT
