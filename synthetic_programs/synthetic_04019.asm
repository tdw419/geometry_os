; mixed program
; initialization
  LDI r0, 8
  LDI r11, 8
  LDI r9, 0xF4E1F3
  LDI r7, 8
  LDI r13, 0xD30449
  LDI r14, 0x3F615A
  LDI r29, 4
; palette
  LDI r2, 0x6001
  LDI r7, 1
  LDI r13, 0x0000CC
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0xFFAA00
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0x0044FF
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0x888800
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0x008888
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0xAAAAAA
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0x00FFFF
  STORE r2, r13
  ADD r2, r2, r7
  LDI r13, 0x0044FF
  STORE r2, r13
  ADD r2, r2, r7
  SAR r12, r10, r4
  SHLI r3, r14, 4
  PUSH r12
  PUSH r8
  PUSH r6
  SHR r15, r4, r26
  MUL r2, r12, r1
  DIV r14, r5, r1
  DIV r3, r8, r2
  POP r6
  POP r8
  POP r12
  LDI r0, 1859
  LDI r10, 1
  LDI r14, 2
  TEXT r0, r10, r14, "HELLO"
  CMP r1, r12
  JZ r1, else_0
  MUL r11, r8, r4
  JMP endif_1
else_0:
  LDI r9, 1751
  LDI r12, 0xBAFD6E
  LDI r3, 1997
  LDI r6, 16
  LDI r9, 256
  RECTF r9, r12, r3, r6, r9
endif_1:
  PUSH r1
  PUSH r11
  AND r18, r4, r1
  XOR r13, r2, r10
  SUB r15, r5, r8
  AND r1, r5, r6
  POP r11
  POP r1
  IKEY r15
  CMPI r15, 32
  JNZ r15, key_2
  SHLI r6, r3, 0xD3E075
  SHR r7, r3, r13
  CMP r26, r5
  JNZ r26, else_3
  DIV r6, r10, r13
  JMP endif_4
else_3:
  LDI r8, 936
  LDI r7, 0x40D9FA
  LDI r1, 1894
  WPIXEL
  LDI r6, 2413
  LDI r1, 0x364DCF
  LDI r3, 0xD3BAD0
  PSET r6, r1, r3
endif_4:
main_5:
  LDI r21, 625
  LDI r6, 784
  LDI r9, 1
  DRAWTEXT r21, r6, r9, "WORLD"
  SHL r29, r15, r3
  SHLI r10, r15, 128
  FRAME
  JMP main_5
