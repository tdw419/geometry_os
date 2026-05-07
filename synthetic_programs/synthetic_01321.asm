; counted animation
; initialization
  LDI r10, 1
  LDI r14, 709
  LDI r8, 0xE1F817
  LDI r0, 0x1EE001
  LDI r15, 1
  LDI r9, 2857
  LDI r7, 651
  LDI r3, 0x6F86C2
  LDI r5, 16
loop_0:
  LDI r2, 0x37C77B
  FILL r2
  LDI r13, 1
  SUB r5, r5, r13
  JNZ r5, loop_0
  LDI r10, 41
loop_1:
  SUBI r10, r0, 87
  LDI r7, 1
  SUB r10, r10, r7
  JNZ r10, loop_1
  HALT
