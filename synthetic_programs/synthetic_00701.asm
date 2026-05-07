; input driven program
; initialization
  LDI r8, 0xE0A779
  LDI r13, 255
  LDI r6, 0xDA6A48
  LDI r3, 0xE36455
  LDI r11, 0x9FFFC2
  LDI r0, 32
  LDI r10, 1140
  LDI r14, 4000
main_0:
  AND r5, r9, r15
  AND r6, r14, r8
  XOR r13, r6, r12
  IKEY r12
  CMPI r12, 0xBA48BD
  JNZ r12, key_1
  LDI r0, 64
  LDI r14, 1532
  LDI r2, 1
  TEXT r0, r14, r2, "HELLO"
  DIV r1, r14, r10
  FRAME
  JMP main_0
