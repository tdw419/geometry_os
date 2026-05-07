; mixed program
; initialization
  LDI r12, 64
  LDI r13, 32
  LDI r14, 255
  LDI r1, 0xA7EB1B
  LDI r2, 256
; palette
  LDI r4, 0x233C
  LDI r11, 1
  LDI r1, 0xFF00FF
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0x550077
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0x008888
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0xFFFFFF
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0x444444
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0x008888
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0x44FF00
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0xFFAA00
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0xAAFF00
  STORE r4, r1
  ADD r4, r4, r11
  LDI r1, 0xFFEE00
  STORE r4, r1
  ADD r4, r4, r11
  CMP r14, r11
  JZ r14, else_0
  MOD r3, r6, r5
  XOR r7, r9, r15
  DIV r10, r0, r8
  DIV r3, r14, r8
  JMP endif_1
else_0:
  LDI r10, 0xBF5DDF
  LDI r6, 0x605B7D
  LDI r5, 0x4B783E
  WPIXEL
endif_1:
  LDI r15, 0
loop_2:
  DIV r12, r2, r13
  LDI r2, 2056
  LDI r11, 10
  LDI r0, 345
  LDI r10, 2388
  LDI r9, 8
  RECTF r2, r11, r0, r10, r9
  ANDI r19, r13, 4
  LDI r11, 1381
  LDI r11, 0x4DE8BD
  LDI r12, 32
  LDI r12, 32
  CIRCLE r11, r11, r12, r12
  LDI r12, 1
  SUB r15, r15, r12
  JNZ r15, loop_2
  AND r9, r15, r2
  IKEY r8
  CMPI r8, 0xD66CBA
  JNZ r8, key_3
  LDI r9, 0xD64F1B
  LDI r3, 8
  LDI r9, 1326
  DRAWTEXT r9, r3, r9, "WORLD"
  CMP r12, r1
  PUSH r10
  PUSH r8
  SHR r22, r29, r8
  DIV r4, r22, r12
  SHL r13, r10, r6
  SUB r0, r4, r15
  OR r6, r9, r7
  POP r8
  POP r10
  CMP r9, r4
  JNZ r9, else_4
  MUL r2, r3, r1
  MUL r10, r20, r9
  JMP endif_5
else_4:
  LDI r12, 0
  FILL r12
  LDI r3, 0x695EBE
  LDI r1, 0x9BEE03
  LDI r14, 715
  LDI r11, 64
  CIRCLE r3, r1, r14, r11
  LDI r6, 0xEC7F37
  FILL r6
  LDI r3, 16
  FILL r3
endif_5:
  HALT
