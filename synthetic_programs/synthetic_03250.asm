; mixed program
; initialization
  LDI r8, 4
  LDI r7, 3785
  LDI r11, 16
  LDI r28, 0x432285
  LDI r10, 64
  LDI r4, 2122
  LDI r7, 6
loop_0:
  SHL r7, r5, r2
  SUBI r5, r14, 0x74AC4B
  SUBI r11, r4, 256
  LDI r9, 0xC1F47C
  LDI r10, 0xAB8247
  LDI r1, 1275
  LDI r1, 255
  LDI r10, 2
  RECTF r9, r10, r1, r1, r10
  LDI r29, 1
  SUB r7, r7, r29
  JNZ r7, loop_0
  LDI r4, 0x86F5C2
loop_1:
  LDI r9, 1430
  LDI r30, 2293
  LDI r11, 0xD024F2
  PSET r9, r30, r11
  SUBI r3, r15, 78
  LDI r6, 477
  FILL r6
  LDI r4, 64
  LDI r15, 128
  LDI r4, 0xE4D47D
  PSETI
  LDI r1, 1
  SUB r4, r4, r1
  JNZ r4, loop_1
  CMP r6, r8
  JZ r6, else_2
  XOR r1, r14, r11
  OR r3, r11, r2
  SHR r14, r8, r24
  SHR r7, r4, r12
  JMP endif_3
else_2:
  LDI r2, 4
  LDI r11, 32
  LDI r6, 32
  LDI r7, 8
  CIRCLE r2, r11, r6, r7
  LDI r8, 861
  LDI r28, 64
  LDI r8, 4
  LDI r3, 0
  LDI r10, 1374
  RECTF r8, r28, r8, r3, r10
  LDI r4, 128
  LDI r15, 64
  LDI r1, 0x60C8D3
  PSET r4, r15, r1
endif_3:
  HALT
