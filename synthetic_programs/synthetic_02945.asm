; conditional logic
; initialization
  LDI r9, 1049
  LDI r0, 10
  LDI r1, 3500
  LDI r11, 4
  LDI r6, 313
  LDI r29, 128
  LDI r10, 0xAD89DF
  LDI r2, 80
  CMP r3, r6
  JNZ r3, else_0
  XOR r31, r10, r6
  SUB r9, r11, r3
  XOR r2, r14, r7
  JMP endif_1
else_0:
  LDI r0, 2230
  LDI r14, 0x9D991E
  LDI r8, 0x42CF25
  LDI r4, 0x410560
  CIRCLE r0, r14, r8, r4
  LDI r12, 3764
  FILL r12
endif_1:
  HALT
