; counted animation
; initialization
  LDI r4, 1502
  LDI r3, 8
  LDI r15, 10
loop_0:
  MOD r7, r11, r6
  LDI r15, 0x216C07
  LDI r6, 0xCAA1BE
  LDI r7, 1560
  WPIXEL
  LDI r3, 1
  SUB r15, r15, r3
  JNZ r15, loop_0
  LDI r10, 0x60F388
loop_1:
  CMPI r9, r2, 0x63E10F
  MUL r13, r12, r6
  LDI r5, 1
  SUB r10, r10, r5
  JNZ r10, loop_1
  LDI r4, 8
loop_2:
  LDI r5, 0xBB0E53
  LDI r7, 0xD4CC25
  LDI r15, 1171
  PSET r5, r7, r15
  LDI r8, 0x51748A
  LDI r0, 1206
  LDI r4, 0x927838
  LDI r7, 0x17C656
  CIRCLE r8, r0, r4, r7
  ADDI r12, r15, 0x5EF042
  XOR r0, r12, r7
  LDI r9, 1
  SUB r4, r4, r9
  JNZ r4, loop_2
  HALT
