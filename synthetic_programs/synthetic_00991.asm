; mixed program
; initialization
  LDI r10, 256
  LDI r12, 879
  LDI r16, 0
; palette
  LDI r0, 0x5005
  LDI r8, 1
  LDI r24, 0xFFFF00
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0xFF4400
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0xAAFF00
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0x00FF00
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0x00FF44
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0xFF8800
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0x0044FF
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0x444444
  STORE r0, r24
  ADD r0, r0, r8
  LDI r24, 0x00FF44
  STORE r0, r24
  ADD r0, r0, r8
  CMP r4, r15
  JZ r4, else_0
  XOR r6, r8, r12
  DIV r9, r6, r15
  MOD r7, r12, r14
  JMP endif_1
else_0:
  LDI r3, 128
  FILL r3
endif_1:
  IKEY r10
  CMPI r10, 4
  JNZ r10, key_2
  CMP r8, r13
  JZ r8, else_3
  MOD r15, r7, r23
  JMP endif_4
else_3:
  LDI r11, 2
  LDI r5, 986
  LDI r2, 0xA79A8E
  LDI r7, 3314
  LDI r7, 2230
  RECTF r11, r5, r2, r7, r7
endif_4:
  LDI r11, 10
  LDI r0, 778
  LDI r3, 3496
  TEXT r11, r0, r3, "HELLO"
  LDI r5, 4
loop_5:
  ANDI r11, r6, 0x69494D
  CMPI r18, r14, 163
  CMPI r6, r18, 243
  ANDI r8, r10, 32
  LDI r1, 1
  SUB r5, r5, r1
  JNZ r5, loop_5
  LDI r3, 0x25A302
  LDI r1, 8
  LDI r2, 1552
  TEXT r3, r1, r2, "HELLO"
  CALL func_6
func_6:
  AND r9, r2, r15
  AND r14, r12, r2
  SHR r13, r2, r6
  SUB r12, r7, r11
  RET
main_7:
  IKEY r10
  CMPI r10, 0x02C122
  JNZ r10, key_8
  LDI r12, 0x8A266D
  LDI r3, 0x9F9CFA
  LDI r11, 0x5A18DA
  TEXT r12, r3, r11, "HELLO"
  SHR r0, r10, r4
  FRAME
  JMP main_7
