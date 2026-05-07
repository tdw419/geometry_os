; counted animation
; initialization
  LDI r0, 4010
  LDI r6, 0xE51FDF
  LDI r11, 0x42209C
loop_0:
  LDI r30, 32
  LDI r14, 255
  LDI r2, 0x3E1610
  WPIXEL
  LDI r10, 1
  SUB r11, r11, r10
  JNZ r11, loop_0
  LDI r8, 30
loop_1:
  MUL r9, r10, r12
  SHR r3, r5, r10
  ANDI r19, r3, 0x61CA1A
  LDI r7, 1
  SUB r8, r8, r7
  JNZ r8, loop_1
  HALT
