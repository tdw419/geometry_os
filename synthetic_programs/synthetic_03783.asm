; counted animation
; initialization
  LDI r9, 0x1822CD
  LDI r0, 0x31032B
  LDI r6, 3037
  LDI r13, 3241
  LDI r13, 128
loop_0:
  SHR r1, r2, r6
  SUBI r1, r10, 36
  SHL r29, r13, r5
  LDI r10, 1
  SUB r13, r13, r10
  JNZ r13, loop_0
  LDI r7, 23
loop_1:
  CMPI r0, r8, 0xB06345
  SUBI r0, r11, 0x2321A1
  LDI r11, 1550
  LDI r14, 73
  LDI r6, 0xF695E2
  PSET r11, r14, r6
  CMPI r11, r12, 8
  LDI r12, 1
  SUB r7, r7, r12
  JNZ r7, loop_1
  HALT
