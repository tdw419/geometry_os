; counted animation
; initialization
  LDI r2, 1748
  LDI r9, 8
  LDI r5, 10
  LDI r11, 0x61C177
  LDI r8, 2139
  LDI r15, 0x21F741
  LDI r10, 0x5F4D35
loop_0:
  ANDI r1, r8, 0xCB7FA8
  LDI r4, 2
  FILL r4
  XOR r17, r13, r7
  SUBI r0, r14, 0xBF9C9E
  LDI r9, 1
  SUB r10, r10, r9
  JNZ r10, loop_0
  HALT
