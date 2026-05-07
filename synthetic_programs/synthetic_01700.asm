; mixed program
; initialization
  LDI r13, 10
  LDI r11, 0x9B9BBF
  LDI r23, 959
  LDI r5, 0x47BD95
  LDI r13, 2190
  FILL r13
  LDI r2, 40
loop_0:
  AND r3, r1, r11
  LDI r9, 1
  SUB r2, r2, r9
  JNZ r2, loop_0
  IKEY r7
  CMPI r7, 192
  JNZ r7, key_1
  AND r18, r0, r4
  OR r1, r0, r11
  AND r0, r3, r24
  CMP r1, r15
  JZ r1, else_2
  MUL r14, r10, r9
  JMP endif_3
else_2:
  LDI r8, 10
  LDI r2, 3088
  LDI r10, 0
  PSETI
  LDI r11, 0xEA8B9B
  LDI r0, 32
  LDI r1, 10
  WPIXEL
  LDI r15, 3806
  LDI r0, 0x083B49
  LDI r4, 1051
  PSET r15, r0, r4
endif_3:
main_4:
  ANDI r13, r11, 64
  IKEY r5
  CMPI r5, 0xAFE9CA
  JNZ r5, key_5
  FRAME
  JMP main_4
