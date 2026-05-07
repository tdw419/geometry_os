; counted animation
; initialization
  LDI r3, 4
  LDI r16, 255
  LDI r3, 0xDA3E76
loop_0:
  SUBI r1, r9, 64
  ANDI r12, r9, 0xC688D3
  LDI r12, 335
  LDI r15, 0x8B6073
  LDI r10, 3950
  LDI r10, 0xA23329
  CIRCLE r12, r15, r10, r10
  LDI r13, 1
  SUB r3, r3, r13
  JNZ r3, loop_0
  LDI r8, 0
loop_1:
  LDI r10, 3035
  FILL r10
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_1
  HALT
