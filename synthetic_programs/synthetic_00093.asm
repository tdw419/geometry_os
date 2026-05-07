; counted animation
; initialization
  LDI r1, 8
  LDI r6, 1085
  LDI r7, 3803
  LDI r2, 0x3B999E
  LDI r15, 0x6E13AF
  LDI r9, 913
  LDI r14, 255
  LDI r0, 0xD07870
loop_0:
  MUL r15, r9, r7
  OR r14, r5, r10
  CMPI r5, r13, 32
  LDI r5, 1
  SUB r0, r0, r5
  JNZ r0, loop_0
  LDI r3, 64
loop_1:
  OR r9, r6, r4
  DIV r5, r15, r13
  ANDI r8, r9, 256
  LDI r10, 1
  SUB r3, r3, r10
  JNZ r3, loop_1
  LDI r13, 0
loop_2:
  LDI r4, 159
  LDI r6, 0x83092B
  LDI r11, 0xDAE110
  LDI r10, 1761
  CIRCLE r4, r6, r11, r10
  CMPI r3, r5, 256
  ADD r12, r15, r1
  ANDI r14, r3, 37
  LDI r4, 1
  SUB r13, r13, r4
  JNZ r13, loop_2
  HALT
