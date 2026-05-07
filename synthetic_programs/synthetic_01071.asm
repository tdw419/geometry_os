; input driven program
; initialization
  LDI r14, 0x4DD42F
  LDI r8, 2012
  LDI r12, 732
  LDI r3, 3498
  LDI r1, 0x0428AC
  LDI r15, 0xF5812A
main_0:
  LDI r3, 0x2C4A44
  LDI r5, 64
  LDI r3, 1
  WPIXEL
  IKEY r1
  CMPI r1, 29
  JNZ r1, key_1
  IKEY r0
  CMPI r0, 139
  JNZ r0, key_2
  LDI r3, 1855
  LDI r9, 2
  LDI r14, 2857
  DRAWTEXT r3, r9, r14, "WORLD"
  MOD r7, r10, r6
  LDI r6, 4024
  LDI r5, 32
  LDI r7, 256
  TEXT r6, r5, r7, "HELLO"
  FRAME
  JMP main_0
