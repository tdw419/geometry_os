; mixed program
; initialization
  LDI r12, 256
  LDI r24, 1999
  LDI r9, 16
  LDI r8, 2811
  LDI r10, 128
  LDI r2, 1
  LDI r4, 2800
  LDI r2, 0x6B6CDF
  LDI r2, 0x1915EA
  TEXT r4, r2, r2, "HELLO"
  LDI r0, 32
  FILL r0
  CMP r15, r1
  JZ r15, else_0
  ADD r15, r9, r17
  JMP endif_1
else_0:
  LDI r1, 404
  LDI r14, 255
  LDI r3, 0x350AA2
  WPIXEL
  LDI r10, 16
  LDI r11, 3282
  LDI r0, 16
  LDI r1, 32
  LDI r13, 3902
  LINE r10, r11, r0, r1, r13
  LDI r7, 32
  LDI r4, 0xEB9BDD
  LDI r15, 0xE42140
  PSET r7, r4, r15
endif_1:
  LDI r12, 0x7E0489
  LDI r15, 0
  LDI r1, 0xA10AFF
  LDI r14, 0x342F3C
  LDI r9, 16
  RECTF r12, r15, r1, r14, r9
  LDI r13, 0x255AB1
loop_2:
  LDI r11, 0x2BB52A
  LDI r14, 0xF3B1B8
  LDI r0, 0x5733DB
  WPIXEL
  LDI r10, 1
  SUB r13, r13, r10
  JNZ r13, loop_2
  MUL r10, r24, r2
  HALT
