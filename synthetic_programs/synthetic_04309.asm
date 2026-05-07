; mixed program
; initialization
  LDI r4, 256
  LDI r2, 4
  LDI r0, 0x87616A
; palette
  LDI r12, 0x704A
  LDI r11, 1
  LDI r15, 0x444444
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x000000
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0xFFFFFF
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0xDD0044
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x44FF00
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0xFFFFFF
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x000066
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x00FFAA
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0xAAFF00
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x000066
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x00FFAA
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x0044FF
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0x0000CC
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0xFF8800
  STORE r12, r15
  ADD r12, r12, r11
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r11
  LDI r11, 0x9E167F
loop_0:
  LDI r5, 0x459EC7
  LDI r31, 128
  LDI r15, 0x6F2CAB
  LDI r15, 0x439B69
  LDI r6, 3385
  LINE r5, r31, r15, r15, r6
  SUBI r2, r9, 0xA50602
  XOR r3, r6, r1
  ADDI r14, r12, 0xCBD243
  LDI r0, 1
  SUB r11, r11, r0
  JNZ r11, loop_0
  CALL func_1
func_1:
  SHR r13, r1, r15
  ADD r4, r0, r11
  RET
  CMP r10, r7
  JNZ r10, else_2
  ADD r9, r8, r4
  JMP endif_3
else_2:
  LDI r13, 0x7C7045
  LDI r12, 2633
  LDI r11, 1042
  LDI r19, 0x12852F
  LDI r13, 1532
  RECTF r13, r12, r11, r19, r13
  LDI r2, 1979
  LDI r8, 8
  LDI r18, 0x784618
  LDI r10, 783
  CIRCLE r2, r8, r18, r10
endif_3:
  SUB r13, r12, r4
  CMP r1, r5
  JNZ r1, else_4
  DIV r3, r15, r8
  JMP endif_5
else_4:
  LDI r8, 2134
  LDI r12, 0x50141D
  LDI r12, 1890
  LDI r2, 2
  LDI r12, 3296
  RECTF r8, r12, r12, r2, r12
  LDI r4, 1974
  LDI r0, 255
  LDI r4, 564
  PSETI
  LDI r3, 2
  LDI r1, 0x687441
  LDI r13, 0x364B8F
  PSETI
endif_5:
  LDI r13, 128
  LDI r7, 1789
  LDI r29, 2
  LDI r7, 10
  LDI r8, 0x11F409
  LINE r13, r7, r29, r7, r8
main_6:
  LDI r15, 0x78BB57
  LDI r15, 1232
  LDI r5, 255
  LDI r13, 1635
  CIRCLE r15, r15, r5, r13
  MOD r1, r13, r11
  IKEY r13
  CMPI r13, 36
  JNZ r13, key_7
  DIV r3, r14, r9
  FRAME
  JMP main_6
