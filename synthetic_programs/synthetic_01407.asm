; mixed program
; initialization
  LDI r26, 0
  LDI r28, 8
  LDI r7, 0x3B04F4
  LDI r3, 2
  LDI r1, 0x12BD2D
  LDI r4, 64
  XOR r8, r15, r1
  AND r6, r13, r14
  XOR r3, r7, r14
  LDI r1, 16
  LDI r3, 303
  LDI r0, 3150
  TEXT r1, r3, r0, "HELLO"
  IKEY r5
  CMPI r5, 0x33310F
  JNZ r5, key_0
  HALT
