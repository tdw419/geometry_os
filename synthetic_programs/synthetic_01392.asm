; mixed program
; initialization
  LDI r12, 0xD3A5D6
  LDI r1, 4
  LDI r2, 0xBC4953
  LDI r5, 0x8BF605
  LDI r11, 2866
  LDI r8, 0xD38392
  LDI r3, 558
  LDI r9, 1
  LDI r11, 16
loop_0:
  LDI r7, 32
  LDI r8, 0xCD0A49
  LDI r20, 0
  PSET r7, r8, r20
  CMPI r0, r4, 4
  LDI r15, 952
  LDI r11, 0x8814D7
  LDI r18, 16
  WPIXEL
  ANDI r7, r1, 256
  LDI r7, 1
  SUB r11, r11, r7
  JNZ r11, loop_0
  LDI r12, 0xA5284A
  LDI r30, 3655
  LDI r6, 255
  TEXT r12, r30, r6, "HELLO"
  OR r14, r11, r13
  OR r13, r27, r8
  LDI r10, 32
  LDI r5, 0xC91563
  LDI r8, 0x79AF8D
  DRAWTEXT r10, r5, r8, "WORLD"
  CMP r8, r28
  JZ r8, else_1
  DIV r13, r1, r6
  JMP endif_2
else_1:
  LDI r3, 3231
  LDI r14, 8
  LDI r11, 256
  LDI r11, 2823
  LDI r1, 1093
  RECTF r3, r14, r11, r11, r1
  LDI r15, 0xD68A1B
  LDI r1, 1936
  LDI r0, 2898
  LDI r7, 1
  CIRCLE r15, r1, r0, r7
  LDI r29, 0xB44AA4
  FILL r29
endif_2:
  HALT
