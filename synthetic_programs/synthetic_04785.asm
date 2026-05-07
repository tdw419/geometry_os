; mixed program
; initialization
  LDI r7, 0x5F83EB
  LDI r4, 32
  LDI r8, 0xC8A3CB
  LDI r9, 32
loop_0:
  LDI r12, 0x5AC88A
  LDI r0, 0x28B812
  LDI r13, 2130
  LDI r2, 255
  CIRCLE r12, r0, r13, r2
  LDI r10, 3779
  LDI r15, 0x78EB4C
  LDI r13, 1211
  PSETI
  LDI r0, 1596
  LDI r25, 64
  LDI r10, 687
  PSET r0, r25, r10
  LDI r8, 1
  SUB r9, r9, r8
  JNZ r9, loop_0
  CMP r13, r11
  JZ r13, else_1
  ADD r3, r5, r15
  MOD r7, r27, r1
  JMP endif_2
else_1:
  LDI r4, 32
  LDI r5, 32
  LDI r6, 0x3B6A66
  LDI r4, 4
  CIRCLE r4, r5, r6, r4
  LDI r14, 64
  LDI r14, 255
  LDI r0, 2
  WPIXEL
endif_2:
  LDI r6, 2452
  LDI r6, 1342
  LDI r0, 16
  TEXT r6, r6, r0, "HELLO"
  MOD r7, r14, r13
  LDI r12, 0x1B7F73
loop_3:
  CMPI r12, r15, 10
  LDI r13, 1599
  LDI r8, 2438
  LDI r1, 0x3C32C1
  WPIXEL
  ADDI r2, r1, 64
  LDI r7, 1
  SUB r12, r12, r7
  JNZ r12, loop_3
  PUSH r5
  PUSH r8
  PUSH r13
  DIV r4, r8, r1
  OR r5, r15, r6
  OR r8, r7, r4
  XOR r4, r1, r11
  DIV r3, r1, r6
  POP r13
  POP r8
  POP r5
  SHR r14, r30, r4
  SHR r8, r10, r7
  SHLI r13, r15, 5
main_4:
  IKEY r8
  CMPI r8, 256
  JNZ r8, key_5
  LDI r8, 0xDAB263
  LDI r15, 1342
  LDI r15, 656
  LDI r9, 0xD8E76D
  LDI r11, 3377
  LINE r8, r15, r15, r9, r11
  FRAME
  JMP main_4
