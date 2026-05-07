; counted animation
; initialization
  LDI r1, 0x57F8C6
  LDI r10, 0xD5D08A
  LDI r4, 1
  LDI r3, 128
  LDI r13, 0xE5CF43
  LDI r4, 29
loop_0:
  SUBI r12, r15, 255
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  HALT
