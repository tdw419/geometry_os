; counted animation
; initialization
  LDI r3, 0x5F7AD6
  LDI r9, 2
  LDI r5, 256
  LDI r14, 255
  LDI r1, 0xB4B57D
loop_0:
  CMPI r10, r7, 10
  CMPI r31, r18, 71
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_0
  LDI r9, 26
loop_1:
  SUBI r2, r13, 0xE5A5AC
  DIV r11, r8, r12
  ANDI r13, r10, 204
  LDI r12, 1
  SUB r9, r9, r12
  JNZ r9, loop_1
  LDI r8, 14
loop_2:
  LDI r2, 1272
  LDI r14, 0x19329F
  LDI r3, 0x933968
  WPIXEL
  ANDI r11, r8, 1
  SUBI r8, r2, 130
  LDI r7, 1
  SUB r8, r8, r7
  JNZ r8, loop_2
  HALT
