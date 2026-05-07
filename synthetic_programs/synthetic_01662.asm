; mixed program
; initialization
  LDI r0, 3099
  LDI r1, 0xD97F96
  LDI r8, 580
  LDI r13, 16
  LDI r6, 0xE208B9
; palette
  LDI r4, 0x40CB
  LDI r19, 1
  LDI r7, 0xDD0044
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0x0000FF
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0xFF00FF
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0xFF4400
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0x444444
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0x880088
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0xAA00AA
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0x0044FF
  STORE r4, r7
  ADD r4, r4, r19
  LDI r7, 0xAAFF00
  STORE r4, r7
  ADD r4, r4, r19
  LDI r3, 0xCEF3B6
  STORE r3, r7
  LOAD r0, r3
  LDI r0x30985, 0x3098086
  STORE r15, r3
  LOAD r9, r15
  SHLI r2, r4, 4
  SHR r1, r5, r3
  PUSH r15
  SHR r3, r1, r10
  SHR r11, r15, r27
  POP r15
  CMP r14, r0
  JNZ r14, else_0
  SHR r8, r30, r11
  JMP endif_1
else_0:
  LDI r4, 10
  LDI r4, 2726
  LDI r14, 32
  LDI r0, 2857
  CIRCLE r4, r4, r14, r0
  LDI r3, 1519
  FILL r3
  LDI r5, 3243
  LDI r10, 128
  LDI r0, 0x9FE8E7
  PSETI
  LDI r13, 0x05DD21
  LDI r16, 0x2F43E7
  LDI r12, 207
  WPIXEL
endif_1:
  CMP r4, r3
  XOR r13, r4, r7
  CMP r13, r0
  JNZ r13, else_2
  OR r8, r12, r13
  SHR r13, r4, r12
  JMP endif_3
else_2:
  LDI r1, 0xE0994E
  LDI r15, 4059
  LDI r11, 0x719B8E
  PSETI
  LDI r7, 3788
  LDI r12, 2
  LDI r12, 16
  PSET r7, r12, r12
  LDI r4, 0xE8D872
  LDI r12, 481
  LDI r2, 3146
  LDI r6, 2435
  LDI r7, 32
  RECTF r4, r12, r2, r6, r7
endif_3:
  LDI r24, 32
  STORE r24, r1
  LOAD r7, r24
  LDI r0x6043, 0x6043x2DBDC6
  STORE r0, r1
  LOAD r29, r0
  HALT
