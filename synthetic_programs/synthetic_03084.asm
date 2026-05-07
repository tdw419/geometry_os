; mixed program
; initialization
  LDI r7, 32
  LDI r0, 0xE38825
  LDI r4, 0xCC0EA7
  LDI r14, 32
  LDI r5, 0x1DCDA5
  LDI r28, 2224
  LDI r8, 1
; palette
  LDI r15, 0x3075
  LDI r13, 1
  LDI r2, 0x00FFFF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x000000
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x44FF00
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x0044FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xDD0044
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xAAAAAA
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x0000CC
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFF8800
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x8800FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x44FF00
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x0000FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x00FF00
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFF00FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x00FFAA
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFF00FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r13, 27
loop_0:
  SHR r6, r5, r12
  SHL r11, r13, r8
  LDI r4, 1
  SUB r13, r13, r4
  JNZ r13, loop_0
  LDI r15, 1589
  LDI r13, 255
  LDI r11, 0x6AEB38
  DRAWTEXT r15, r13, r11, "WORLD"
  CMP r15, r8
  JZ r15, else_1
  DIV r8, r0, r1
  JMP endif_2
else_1:
  LDI r6, 16
  LDI r1, 0xB1380C
  LDI r11, 0x7588CC
  LDI r9, 2345
  LDI r14, 2063
  RECTF r6, r1, r11, r9, r14
endif_2:
  OR r16, r15, r2
  OR r15, r5, r6
  IKEY r31
  CMPI r31, 1
  JNZ r31, key_3
  SHLI r6, r5, 3
  SHL r11, r6, r5
  SHL r10, r2, r3
  SHR r5, r13, r1
  CALL func_4
func_4:
  SHL r1, r3, r0
  XOR r7, r10, r3
  AND r8, r11, r15
  SUB r1, r0, r2
  SUB r11, r10, r2
  DIV r2, r9, r7
  RET
main_5:
  SUB r11, r2, r12
  IKEY r14
  CMPI r14, 0xC160B9
  JNZ r14, key_6
  SUBI r3, r12, 0xDC6AEA
  LDI r1, 255
  LDI r10, 2345
  LDI r11, 3658
  DRAWTEXT r1, r10, r11, "WORLD"
  LDI r7, 0x3F1457
  LDI r5, 1700
  LDI r0, 64
  DRAWTEXT r7, r5, r0, "WORLD"
  FRAME
  JMP main_5
