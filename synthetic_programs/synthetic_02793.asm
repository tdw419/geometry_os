; conditional logic
; initialization
  LDI r11, 619
  LDI r15, 1631
  LDI r10, 0xD00E36
  LDI r13, 0x605AF1
  LDI r0, 0x90FC8F
  LDI r8, 1018
  CMP r1, r10
  JNZ r1, else_0
  MOD r11, r0, r3
  AND r3, r10, r9
  ADD r14, r8, r13
  JMP endif_1
else_0:
  LDI r6, 0xED9341
  LDI r4, 915
  LDI r12, 2218
  LDI r10, 0x83B13D
  LDI r11, 64
  RECTF r6, r4, r12, r10, r11
  LDI r11, 128
  LDI r0, 1
  LDI r11, 731
  WPIXEL
  LDI r5, 3560
  LDI r6, 64
  LDI r1, 0xF55F45
  LDI r3, 2785
  CIRCLE r5, r6, r1, r3
endif_1:
  CMP r10, r9
  JNZ r10, else_2
  XOR r10, r1, r2
  JMP endif_3
else_2:
  LDI r0, 0xF2D1D5
  LDI r15, 0xB131CC
  LDI r15, 255
  LDI r8, 0x9F4ADB
  CIRCLE r0, r15, r15, r8
  LDI r6, 0xC4861C
  LDI r9, 128
  LDI r6, 264
  LDI r10, 4013
  LDI r0, 255
  LINE r6, r9, r6, r10, r0
endif_3:
  CMP r4, r9
  JNZ r4, else_4
  XOR r11, r13, r12
  XOR r13, r26, r4
  SHR r13, r0, r5
  SHR r4, r3, r10
  JMP endif_5
else_4:
  LDI r1, 101
  LDI r15, 394
  LDI r3, 16
  WPIXEL
  LDI r7, 4063
  LDI r11, 2
  LDI r7, 128
  LDI r12, 0x592290
  LDI r13, 128
  RECTF r7, r11, r7, r12, r13
  LDI r3, 256
  LDI r2, 0x52E4E4
  LDI r8, 4043
  LDI r12, 0x5EB30F
  LDI r3, 0xE66E85
  LINE r3, r2, r8, r12, r3
endif_5:
  HALT
