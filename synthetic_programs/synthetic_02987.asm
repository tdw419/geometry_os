; counted animation
; initialization
  LDI r6, 2
  LDI r5, 0x68D252
  LDI r3, 0xE35116
  LDI r3, 255
loop_0:
  LDI r3, 3815
  LDI r30, 4079
  LDI r5, 1206
  WPIXEL
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_0
  LDI r9, 0x9A6985
loop_1:
  SUBI r3, r9, 0x82A79B
  MOD r24, r10, r0
  MOD r15, r7, r21
  LDI r10, 1
  SUB r9, r9, r10
  JNZ r9, loop_1
  LDI r3, 32
loop_2:
  SHL r4, r1, r13
  SUBI r10, r4, 0x8E0311
  ADDI r9, r5, 182
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_2
  HALT
