; conditional logic
; initialization
  LDI r2, 1
  LDI r7, 0x16C030
  LDI r6, 0x802ABC
  LDI r3, 0x4AD98E
  LDI r10, 255
  LDI r5, 32
  LDI r1, 0x29B209
  LDI r11, 1991
  CMP r13, r0
  JNZ r13, else_0
  SHR r9, r13, r5
  AND r0, r5, r6
  JMP endif_1
else_0:
  LDI r10, 0x74B7C2
  LDI r3, 3123
  LDI r5, 3677
  LDI r7, 0xE2B857
  LDI r8, 10
  RECTF r10, r3, r5, r7, r8
  LDI r6, 1129
  LDI r12, 0
  LDI r12, 466
  WPIXEL
endif_1:
  HALT
