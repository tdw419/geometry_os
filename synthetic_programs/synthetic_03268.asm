; conditional logic
; initialization
  LDI r14, 419
  LDI r11, 4
  LDI r4, 64
  CMP r3, r0
  JNZ r3, else_0
  MOD r7, r13, r9
  JMP endif_1
else_0:
  LDI r11, 207
  LDI r11, 3706
  LDI r9, 0x25235F
  LDI r5, 64
  LDI r7, 0x5012C3
  RECTF r11, r11, r9, r5, r7
  LDI r0, 1334
  FILL r0
  LDI r15, 0xACCC7B
  FILL r15
endif_1:
  CMP r7, r14
  JNZ r7, else_2
  SHR r10, r12, r1
  MOD r1, r13, r12
  JMP endif_3
else_2:
  LDI r14, 2792
  LDI r10, 3382
  LDI r8, 128
  PSETI
  LDI r8, 0x78E767
  LDI r10, 256
  LDI r9, 0xDDAE12
  WPIXEL
  LDI r14, 32
  LDI r6, 0x79B229
  LDI r5, 0x49851C
  PSETI
  LDI r8, 2552
  LDI r2, 2546
  LDI r0, 128
  WPIXEL
endif_3:
  HALT
