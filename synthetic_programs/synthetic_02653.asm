; mixed program
; initialization
  LDI r7, 128
  LDI r3, 580
  LDI r4, 2
  LDI r5, 64
  LDI r12, 705
  LDI r9, 1222
  LDI r8, 2205
  LDI r10, 1135
  PUSH r0
  PUSH r17
  PUSH r15
  PUSH r4
  SHR r4, r16, r9
  XOR r8, r4, r13
  SHL r12, r15, r7
  POP r4
  POP r15
  POP r17
  POP r0
  LDI r0, 36
loop_0:
  AND r12, r2, r8
  ADDI r0, r6, 2
  SUBI r1, r14, 8
  LDI r13, 1
  SUB r0, r0, r13
  JNZ r0, loop_0
  CMP r7, r13
  JNZ r7, else_1
  SUB r13, r16, r4
  XOR r5, r14, r6
  XOR r9, r15, r3
  JMP endif_2
else_1:
  LDI r2, 10
  FILL r2
  LDI r14, 255
  LDI r2, 4062
  LDI r3, 0xF7166A
  LDI r4, 64
  LDI r12, 2727
  LINE r14, r2, r3, r4, r12
  LDI r8, 255
  FILL r8
  LDI r0, 64
  LDI r5, 1141
  LDI r9, 16
  PSET r0, r5, r9
endif_2:
main_3:
  LDI r5, 0xEE7EEC
  LDI r3, 0x2FA4FB
  LDI r2, 0x06D884
  PSETI
  XOR r12, r31, r14
  IKEY r7
  CMPI r7, 255
  JNZ r7, key_4
  XOR r14, r3, r9
  FRAME
  JMP main_3
