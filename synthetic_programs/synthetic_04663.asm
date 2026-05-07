; mixed program
; initialization
  LDI r8, 1506
  LDI r13, 1563
  LDI r0, 3786
  LDI r1, 0x800BAA
  LDI r14, 0x267354
  LDI r7, 0x3A75B2
  CMP r4, r0
  JZ r4, else_0
  ADD r7, r10, r2
  JMP endif_1
else_0:
  LDI r13, 16
  LDI r1, 0x90043E
  LDI r10, 32
  LDI r11, 2529
  LDI r15, 32
  LINE r13, r1, r10, r11, r15
endif_1:
  LDI r10, 32
  LDI r0, 1427
  LDI r1, 3968
  PSET r10, r0, r1
  LDI r1, 0xDD9920
  LDI r3, 1625
  LDI r4, 0xF3A0F8
  WPIXEL
  PUSH r7
  PUSH r7
  PUSH r10
  ADD r9, r10, r31
  AND r3, r6, r12
  XOR r8, r0, r14
  XOR r1, r10, r15
  POP r10
  POP r7
  POP r7
  CMPI r2, 69
  LDI r2, 1
loop_2:
  LDI r9, 0
  LDI r15, 16
  LDI r12, 747
  PSET r9, r15, r12
  LDI r6, 128
  LDI r1, 10
  LDI r5, 3585
  PSET r6, r1, r5
  ADDI r12, r0, 256
  XOR r5, r7, r11
  LDI r1, 1
  SUB r2, r2, r1
  JNZ r2, loop_2
  OR r1, r2, r9
  AND r26, r2, r1
  AND r0, r6, r11
  AND r12, r2, r5
main_3:
  SHR r14, r8, r30
  SAR r14, r3, r5
  IKEY r3
  CMPI r3, 93
  JNZ r3, key_4
  SHL r8, r9, r3
  LDI r12, 0x83546C
  LDI r10, 0xD59FF5
  LDI r2, 0x6D6FDB
  PSETI
  SAR r12, r5, r11
  SHLI r6, r4, 10
  SHL r11, r0, r9
  FRAME
  JMP main_3
