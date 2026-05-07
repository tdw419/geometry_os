; mixed program
; initialization
  LDI r14, 0xB7464B
  LDI r11, 0xF30C42
  LDI r6, 256
  LDI r15, 0x1C2592
  LDI r7, 0
  LDI r9, 64
  LDI r10, 1551
  STORE r10, r12
  LOAD r3, r10
  LDI r5, 0x50AA88
  STORE r5, r14
  LOAD r4, r5
  LDI r0, 8
  STORE r0, r5
  LOAD r11, r0
  LDI r12, 0xB68DD1
  STORE r12, r9
  LOAD r10, r12
  LDI r4, 3066
  STORE r4, r10
  LOAD r9, r4
  LDI r7, 0x507A55
  STORE r7, r14
  LOAD r9, r7
  LDI r10, 64
  STORE r10, r12
  LOAD r7, r10
  LDI r6, 4
  STORE r6, r14
  LOAD r2, r6
  LDI r12, 3759
  STORE r12, r6
  LOAD r7, r12
  LDI r28, 0x7402AF
  STORE r28, r9
  LOAD r14, r28
  LDI r1, 3007
  STORE r1, r3
  LOAD r4, r1
  SHR r12, r8, r3
  SHR r15, r8, r13
  CMP r9, r8
  JNZ r9, else_0
  SHL r3, r13, r12
  SHL r9, r0, r4
  ADD r15, r0, r9
  DIV r5, r4, r10
  JMP endif_1
else_0:
  LDI r5, 0x9767DC
  LDI r26, 1
  LDI r0, 1
  LDI r15, 0x419083
  LDI r11, 0x9E00E9
  LINE r5, r26, r0, r15, r11
  LDI r10, 251
  FILL r10
endif_1:
  LDI r6, 10
  LDI r15, 3347
  LDI r4, 256
  TEXT r6, r15, r4, "HELLO"
main_2:
  LDI r7, 2304
  LDI r6, 1193
  LDI r13, 2298
  WPIXEL
  LDI r5, 4
  LDI r14, 0
  LDI r2, 0xF8744A
  WPIXEL
  FRAME
  JMP main_2
