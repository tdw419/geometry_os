; counted animation
; initialization
  LDI r6, 1379
  LDI r0, 2013
  LDI r13, 0x73D198
  LDI r7, 512
  LDI r12, 0xC3E089
  LDI r3, 0x60E70F
loop_0:
  LDI r8, 0xAC161C
  LDI r6, 0
  LDI r5, 64
  PSETI
  OR r6, r5, r18
  LDI r15, 0x6D38A9
  LDI r2, 4
  LDI r23, 255
  LDI r13, 86
  LDI r10, 3034
  RECTF r15, r2, r23, r13, r10
  LDI r14, 1
  SUB r3, r3, r14
  JNZ r3, loop_0
  LDI r14, 2
loop_1:
  LDI r2, 32
  LDI r9, 0x9082F3
  LDI r0, 32
  LDI r1, 0x0F5D99
  CIRCLE r2, r9, r0, r1
  SHL r12, r0, r3
  DIV r11, r15, r4
  CMPI r10, r2, 121
  LDI r11, 1
  SUB r14, r14, r11
  JNZ r14, loop_1
  LDI r6, 30
loop_2:
  ADDI r5, r9, 8
  ANDI r13, r6, 32
  LDI r7, 1
  SUB r6, r6, r7
  JNZ r6, loop_2
  HALT
