; mixed program
; initialization
  LDI r28, 286
  LDI r14, 1362
  LDI r3, 0x5346AA
  LDI r27, 1671
  LDI r6, 0
  LDI r13, 0x0A306C
  LDI r2, 128
  LDI r12, 10
  LDI r1, 0x3E48D7
  STORE r1, r14
  LOAD r0, r1
  LDI r2, 1
  STORE r2, r12
  LOAD r15, r2
  LDI r7, 2
  STORE r7, r15
  LOAD r5, r7
  LDI r12, 0x11E1AA
  LDI r15, 0
  LDI r10, 128
  TEXT r12, r15, r10, "HELLO"
  CMP r5, r15
  JZ r5, else_0
  SUB r9, r12, r6
  SUB r12, r14, r8
  DIV r22, r0, r10
  JMP endif_1
else_0:
  LDI r11, 64
  LDI r12, 256
  LDI r12, 1
  LDI r10, 32
  LDI r12, 2
  LINE r11, r12, r12, r10, r12
  LDI r11, 1
  LDI r10, 0xF421A4
  LDI r15, 0
  LDI r3, 8
  CIRCLE r11, r10, r15, r3
  LDI r10, 0x5FCFC4
  LDI r11, 4
  LDI r0, 0x9D1555
  WPIXEL
endif_1:
main_2:
  IKEY r13
  CMPI r13, 144
  JNZ r13, key_3
  LDI r13, 256
  LDI r11, 0x03A686
  LDI r13, 0x90EC3D
  WPIXEL
  FRAME
  JMP main_2
