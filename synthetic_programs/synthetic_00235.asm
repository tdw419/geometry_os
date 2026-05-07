; counted animation
; initialization
  LDI r1, 1987
  LDI r13, 0xB3555C
  LDI r0, 10
  LDI r6, 10
  LDI r5, 0xCFD1C3
  LDI r7, 3550
  LDI r1, 0x013FAD
loop_0:
  AND r2, r6, r9
  CMPI r13, r8, 4
  LDI r9, 1
  SUB r1, r1, r9
  JNZ r1, loop_0
  HALT
