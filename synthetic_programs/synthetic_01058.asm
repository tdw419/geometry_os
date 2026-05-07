; counted animation
; initialization
  LDI r0, 924
  LDI r8, 2892
  LDI r3, 256
  LDI r1, 3353
  LDI r1, 0xF23767
loop_0:
  LDI r6, 32
  LDI r13, 3504
  LDI r13, 3435
  PSETI
  XOR r0, r10, r14
  LDI r4, 2338
  LDI r12, 1176
  LDI r2, 0x3B45E3
  LDI r8, 0xFFF786
  CIRCLE r4, r12, r2, r8
  LDI r8, 1
  SUB r1, r1, r8
  JNZ r1, loop_0
  LDI r6, 64
loop_1:
  LDI r1, 0x01CEEA
  LDI r14, 255
  LDI r3, 2558
  PSETI
  SUBI r1, r31, 215
  LDI r11, 1
  SUB r6, r6, r11
  JNZ r6, loop_1
  LDI r19, 0xD50505
loop_2:
  SHL r8, r10, r11
  SUBI r13, r0, 0xE3C2A7
  MUL r2, r13, r10
  SHL r2, r10, r15
  LDI r11, 1
  SUB r19, r19, r11
  JNZ r19, loop_2
  HALT
