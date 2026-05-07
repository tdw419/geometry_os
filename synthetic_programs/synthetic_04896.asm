; mixed program
; initialization
  LDI r7, 774
  LDI r10, 0x3B0EDB
  LDI r14, 255
  LDI r1, 10
; palette
  LDI r4, 0x2062
  LDI r9, 1
  LDI r12, 0x0044FF
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0x00FF00
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0x000066
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0x0000FF
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0xDD0044
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0x000000
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0x0000FF
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 0x0044FF
  STORE r4, r12
  ADD r4, r4, r9
  LDI r12, 3780
  STORE r12, r5
  LOAD r2, r12
  LDI r1, 32
  STORE r1, r7
  LOAD r27, r1
  LDI r15, 2499
  STORE r15, r8
  LOAD r1, r15
  LDI r3, 1
  STORE r3, r1
  LOAD r0, r3
  LDI r9, 0x8A174C
  STORE r9, r0
  LOAD r30, r9
  XOR r8, r0, r11
  XOR r9, r17, r5
  IKEY r13
  CMPI r13, 239
  JNZ r13, key_0
  CMP r10, r7
  JNZ r10, else_1
  OR r1, r9, r11
  MUL r6, r15, r10
  SHR r7, r12, r9
  JMP endif_2
else_1:
  LDI r10, 8
  LDI r10, 7
  LDI r1, 959
  WPIXEL
endif_2:
  XOR r3, r0, r5
  HALT
