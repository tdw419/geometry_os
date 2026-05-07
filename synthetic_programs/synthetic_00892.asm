; mixed program
; initialization
  LDI r15, 10
  LDI r1, 3827
  LDI r7, 1734
  LDI r10, 323
  LDI r31, 2082
  LDI r3, 0x9BE97E
  LDI r11, 301
  LDI r2, 0xEC1C78
  CMP r10, r3
  JNZ r10, else_0
  DIV r13, r14, r17
  JMP endif_1
else_0:
  LDI r13, 0xE0900B
  LDI r14, 0xB529F0
  LDI r13, 170
  PSETI
  LDI r28, 201
  LDI r9, 4
  LDI r8, 0xE438AC
  LDI r11, 1
  CIRCLE r28, r9, r8, r11
endif_1:
  CMP r6, r3
  JZ r6, else_2
  SHR r8, r5, r9
  SUB r11, r2, r3
  MOD r9, r11, r13
  OR r6, r14, r5
  JMP endif_3
else_2:
  LDI r7, 0x663A2A
  LDI r31, 0x9A7CC1
  LDI r14, 569
  LDI r1, 32
  LDI r10, 2925
  LINE r7, r31, r14, r1, r10
endif_3:
  LDI r4, 16
loop_4:
  OR r12, r8, r15
  LDI r2, 1
  SUB r4, r4, r2
  JNZ r4, loop_4
  LDI r25, 128
  LDI r9, 2730
  LDI r7, 255
  TEXT r25, r9, r7, "HELLO"
  LDI r6, 0xA96BBA
loop_5:
  CMPI r0, r7, 44
  SUB r3, r6, r15
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_5
  LDI r2, 0x2C1EF7
  LDI r6, 2895
  LDI r8, 0x9730E5
  DRAWTEXT r2, r6, r8, "WORLD"
  LDI r3, 1
  LDI r9, 32
  LDI r5, 0x063596
  PSET r3, r9, r5
main_6:
  SUBI r10, r4, 0x33B7EA
  IKEY r1
  CMPI r1, 0x9687F0
  JNZ r1, key_7
  XOR r11, r4, r12
  AND r1, r15, r4
  OR r9, r12, r4
  XOR r1, r14, r15
  FRAME
  JMP main_6
