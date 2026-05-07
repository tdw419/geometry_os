; mixed program
; initialization
  LDI r2, 2
  LDI r14, 411
  LDI r12, 24
  LDI r7, 0xB0024F
  SUB r5, r7, r0
  LDI r15, 32
loop_0:
  LDI r0, 64
  LDI r12, 723
  LDI r12, 8
  LDI r6, 2453
  LDI r5, 64
  RECTF r0, r12, r12, r6, r5
  OR r8, r6, r22
  ADDI r14, r7, 156
  LDI r4, 0xC09C3B
  LDI r9, 0x43027F
  LDI r14, 234
  LDI r15, 0xDBB0CB
  LDI r11, 0xE3F8D0
  RECTF r4, r9, r14, r15, r11
  LDI r6, 1
  SUB r15, r15, r6
  JNZ r15, loop_0
  LDI r4, 28
loop_1:
  ADDI r7, r5, 0x16A8D4
  LDI r7, 64
  LDI r6, 1
  LDI r9, 64
  PSETI
  AND r6, r10, r13
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_1
  SUB r13, r14, r8
  LDI r10, 0x974D44
  LDI r15, 4061
  LDI r14, 0x9A845C
  TEXT r10, r15, r14, "HELLO"
  HALT
