; conditional logic
; initialization
  LDI r4, 0x8C7B33
  LDI r13, 3809
  LDI r5, 0xAE590C
  CMP r15, r8
  JNZ r15, else_0
  SHR r13, r7, r11
  SUB r0, r4, r14
  JMP endif_1
else_0:
  LDI r9, 722
  LDI r6, 22
  LDI r19, 717
  WPIXEL
  LDI r13, 0x8D7E6B
  LDI r7, 0xC319A2
  LDI r10, 0x9890B7
  LDI r10, 3310
  LDI r9, 64
  RECTF r13, r7, r10, r10, r9
  LDI r5, 0x8D0B3D
  LDI r5, 0xFF851F
  LDI r8, 1725
  LDI r1, 1870
  CIRCLE r5, r5, r8, r1
endif_1:
  CMP r7, r0
  JZ r7, else_2
  MOD r10, r22, r12
  ADD r3, r12, r5
  SHL r4, r2, r11
  AND r1, r15, r6
  JMP endif_3
else_2:
  LDI r5, 16
  LDI r2, 1299
  LDI r7, 128
  LDI r23, 0x182757
  LDI r14, 255
  LINE r5, r2, r7, r23, r14
  LDI r4, 256
  LDI r14, 0x68187D
  LDI r14, 16
  LDI r7, 0x5B77F3
  LDI r13, 0xB25F2F
  RECTF r4, r14, r14, r7, r13
  LDI r2, 530
  LDI r3, 0x9C0189
  LDI r9, 3483
  LDI r7, 1287
  LDI r11, 0x646121
  RECTF r2, r3, r9, r7, r11
  LDI r2, 0x7D8F09
  LDI r11, 738
  LDI r1, 10
  LDI r5, 2312
  LDI r15, 16
  LINE r2, r11, r1, r5, r15
endif_3:
  HALT
