; mixed program
; initialization
  LDI r11, 0x2AFDA1
  LDI r13, 1
  LDI r10, 16
  LDI r3, 0x60B5D4
  LDI r10, 0x52B2A4
loop_0:
  SUBI r12, r1, 206
  CMPI r7, r13, 83
  LDI r7, 1
  SUB r10, r10, r7
  JNZ r10, loop_0
  CMP r4, r9
  LDI r0, 4
  LDI r11, 10
  LDI r6, 128
  TEXT r0, r11, r6, "HELLO"
  LDI r6, 256
  LDI r6, 4
  LDI r2, 32
  LDI r10, 0x1740ED
  CIRCLE r6, r6, r2, r10
  LDI r12, 256
  LDI r30, 128
  LDI r31, 1949
  TEXT r12, r30, r31, "HELLO"
  MUL r8, r1, r2
  HALT
