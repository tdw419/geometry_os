; mixed program
; initialization
  LDI r3, 1413
  LDI r0, 0xF45023
  LDI r9, 3166
  LDI r4, 0x6DDEA8
  LDI r10, 0
  CMP r5, r0
  JZ r5, else_0
  SHR r6, r15, r4
  SHR r1, r3, r2
  OR r8, r1, r15
  SHL r21, r14, r8
  JMP endif_1
else_0:
  LDI r10, 2883
  LDI r11, 0x41C313
  LDI r1, 2
  LDI r10, 0xA19DEA
  LDI r0, 1
  LINE r10, r11, r1, r10, r0
  LDI r14, 0x866A27
  LDI r13, 0xC0DC5D
  LDI r3, 3004
  WPIXEL
  LDI r0, 0x6DCA95
  LDI r13, 10
  LDI r5, 8
  LDI r10, 3439
  LDI r12, 1726
  RECTF r0, r13, r5, r10, r12
  LDI r11, 0xE4342C
  LDI r11, 128
  LDI r13, 2559
  LDI r5, 32
  CIRCLE r11, r11, r13, r5
endif_1:
  AND r12, r1, r13
  XOR r13, r15, r12
  XOR r12, r10, r14
  LDI r3, 0x17D763
  LDI r7, 64
  LDI r4, 0xF57689
  TEXT r3, r7, r4, "HELLO"
  LDI r14, 2314
  STORE r14, r10
  LOAD r11, r14
  LDI r1, 32
  STORE r1, r2
  LOAD r15, r1
  LDI r15, 0xBCE632
  STORE r15, r3
  LOAD r11, r15
  HALT
