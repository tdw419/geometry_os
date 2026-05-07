; counted animation
; initialization
  LDI r2, 0x03854B
  LDI r14, 255
  LDI r5, 128
  LDI r15, 46
loop_0:
  LDI r9, 0x64749C
  LDI r1, 32
  LDI r15, 3667
  LDI r9, 0xE8ADA2
  CIRCLE r9, r1, r15, r9
  LDI r12, 1
  SUB r15, r15, r12
  JNZ r15, loop_0
  LDI r3, 128
loop_1:
  SUBI r7, r8, 0xF3A26C
  CMPI r3, r1, 4
  AND r10, r27, r8
  LDI r7, 1
  SUB r3, r3, r7
  JNZ r3, loop_1
  LDI r13, 27
loop_2:
  CMPI r3, r12, 0
  ANDI r9, r0, 16
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_2
  HALT
