; counted animation
; initialization
  LDI r10, 16
  LDI r4, 359
  LDI r14, 3717
  LDI r3, 715
  LDI r9, 0x30BD8D
  LDI r2, 1524
  LDI r1, 748
  LDI r4, 38
loop_0:
  LDI r8, 16
  LDI r4, 3533
  LDI r15, 10
  LDI r11, 2
  LDI r14, 16
  LINE r8, r4, r15, r11, r14
  ADDI r16, r2, 64
  MUL r5, r15, r0
  SHR r1, r5, r8
  LDI r8, 1
  SUB r4, r4, r8
  JNZ r4, loop_0
  LDI r10, 10
loop_1:
  MOD r2, r10, r9
  LDI r13, 0x44C2C8
  LDI r3, 1538
  LDI r12, 963
  PSETI
  LDI r10, 1418
  LDI r4, 0x7B4BA0
  LDI r6, 0
  LDI r15, 32
  LDI r2, 303
  LINE r10, r4, r6, r15, r2
  LDI r2, 1
  SUB r10, r10, r2
  JNZ r10, loop_1
  LDI r8, 39
loop_2:
  ADDI r10, r3, 141
  SHR r12, r8, r13
  ANDI r4, r13, 0xA39CB4
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_2
  HALT
