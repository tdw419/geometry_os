; mixed program
; initialization
  LDI r13, 128
  LDI r11, 3681
  LDI r0, 32
  LDI r15, 1230
  LDI r9, 3486
  LDI r2, 1
  LDI r13, 16
loop_0:
  DIV r15, r5, r9
  ADDI r9, r7, 170
  LDI r10, 0xFB6CDC
  FILL r10
  LDI r14, 1
  SUB r13, r13, r14
  JNZ r13, loop_0
  LDI r0, 0x870017
  LDI r6, 255
  LDI r25, 1578
  PSETI
  IKEY r14
  CMPI r14, 2
  JNZ r14, key_1
  LDI r5, 0
  LDI r15, 0xA79C8F
  LDI r7, 128
  LDI r11, 16
  LDI r13, 2301
  RECTF r5, r15, r7, r11, r13
  LDI r30, 1978
  LDI r7, 1825
  LDI r10, 256
  DRAWTEXT r30, r7, r10, "WORLD"
  MUL r13, r4, r0
  LDI r4, 44
loop_2:
  LDI r2, 10
  LDI r10, 3297
  LDI r0, 8
  LDI r12, 0xD713BF
  CIRCLE r2, r10, r0, r12
  LDI r8, 1
  SUB r4, r4, r8
  JNZ r4, loop_2
main_3:
  SAR r4, r5, r8
  SHR r6, r10, r2
  SAR r3, r0, r4
  SHR r13, r1, r6
  SAR r5, r13, r12
  LDI r4, 0x75C9B3
  LDI r9, 64
  LDI r30, 16
  PSET r4, r9, r30
  FRAME
  JMP main_3
