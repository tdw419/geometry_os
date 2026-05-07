; conditional logic
; initialization
  LDI r9, 0x41D02E
  LDI r13, 255
  LDI r3, 0x2FBF22
  LDI r12, 1
  CMP r1, r15
  JNZ r1, else_0
  SHL r12, r5, r7
  OR r9, r0, r11
  MOD r12, r15, r3
  JMP endif_1
else_0:
  LDI r14, 0
  FILL r14
  LDI r8, 8
  LDI r0, 0x3FB1E6
  LDI r24, 150
  WPIXEL
  LDI r12, 0xD30CB2
  LDI r4, 0xA3D72F
  LDI r15, 16
  LDI r15, 32
  CIRCLE r12, r4, r15, r15
  LDI r25, 16
  LDI r6, 2837
  LDI r2, 128
  LDI r13, 256
  LDI r1, 0x004C2F
  RECTF r25, r6, r2, r13, r1
endif_1:
  HALT
