; mixed program
; initialization
  LDI r10, 16
  LDI r5, 2157
  LDI r12, 4
  LDI r2, 3508
  LDI r6, 0xC9ABFA
  STORE r6, r9
  LOAD r10, r6
  LDI r14, 164
  STORE r14, r6
  LOAD r0, r14
  LDI r11, 0
  STORE r11, r7
  LOAD r1, r11
  LDI r26, 4
  STORE r26, r2
  LOAD r1, r26
  LDI r14, 0x40FEx30x40FEE941
  STORE r14, r8
  LOAD r15, r14
  CALL func_0
func_0:
  SHL r13, r10, r15
  ADD r2, r7, r12
  RET
  CMP r4, r15
  CMP r4, r30
  JZ r4, else_1
  DIV r0, r1, r7
  MUL r14, r9, r15
  JMP endif_2
else_1:
  LDI r4, 0x3B2BB9
  LDI r1, 128
  LDI r15, 64
  WPIXEL
  LDI r3, 636
  LDI r5, 255
  LDI r4, 0x86B6C9
  LDI r4, 256
  CIRCLE r3, r5, r4, r4
  LDI r4, 0x0A08D8
  LDI r7, 0x465848
  LDI r5, 4037
  LDI r0, 64
  LDI r5, 3301
  RECTF r4, r7, r5, r0, r5
  LDI r10, 2
  LDI r9, 550
  LDI r10, 256
  LDI r3, 0xF13A97
  LDI r10, 213
  LINE r10, r9, r10, r3, r10
endif_2:
  DIV r8, r5, r10
  IKEY r2
  CMPI r2, 36
  JNZ r2, key_3
  LDI r2, 0x0EFD2F
  LDI r6, 1393
  LDI r12, 0x108FA3
  TEXT r2, r6, r12, "HELLO"
  LDI r0, 0x9F23C3
loop_4:
  SUBI r7, r5, 0xC2907B
  LDI r27, 1
  SUB r0, r0, r27
  JNZ r0, loop_4
  HALT
