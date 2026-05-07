; mixed program
; initialization
  LDI r4, 0x831C63
  LDI r8, 256
  LDI r9, 46
loop_0:
  OR r10, r11, r13
  LDI r9, 0x007D10
  LDI r11, 0xBE617A
  LDI r5, 0x4459C6
  WPIXEL
  LDI r5, 1635
  LDI r12, 16
  LDI r9, 1399
  LDI r10, 0x0D569C
  CIRCLE r5, r12, r9, r10
  MUL r13, r3, r8
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_0
  LDI r3, 428
  LDI r6, 1
  LDI r0, 255
  PSETI
  LDI r11, 0
  LDI r6, 3349
  LDI r8, 2819
  LDI r4, 2959
  CIRCLE r11, r6, r8, r4
  CMP r13, r1
  JNZ r13, else_1
  MUL r9, r10, r4
  JMP endif_2
else_1:
  LDI r9, 64
  LDI r14, 2854
  LDI r15, 255
  WPIXEL
  LDI r4, 2948
  FILL r4
  LDI r5, 0x1B15FF
  LDI r11, 256
  LDI r2, 3482
  LDI r3, 0x5D6146
  LDI r4, 1275
  RECTF r5, r11, r2, r3, r4
endif_2:
  LDI r18, 0x0DC0FB
loop_3:
  ADDI r2, r12, 93
  CMPI r12, r23, 10
  SUBI r8, r9, 73
  LDI r5, 1
  SUB r18, r18, r5
  JNZ r18, loop_3
  CMP r1, r2
  CMP r13, r14
  JZ r13, else_4
  MOD r8, r11, r3
  JMP endif_5
else_4:
  LDI r13, 0xCD18CD
  FILL r13
  LDI r2, 10
  LDI r13, 255
  LDI r15, 0x3662EF
  LDI r9, 32
  LDI r14, 2261
  RECTF r2, r13, r15, r9, r14
endif_5:
  PUSH r7
  SUB r2, r6, r11
  SHL r13, r3, r14
  POP r7
  HALT
