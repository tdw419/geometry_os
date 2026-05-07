; mixed program
; initialization
  LDI r4, 2361
  LDI r14, 128
  LDI r7, 3787
  LDI r6, 843
  LDI r12, 870
  LDI r0, 10
  LDI r9, 0xC07783
  PSET r12, r0, r9
  LDI r12, 0x4535FE
  LDI r2, 861
  LDI r21, 0
  TEXT r12, r2, r21, "HELLO"
  LDI r9, 45
loop_0:
  MUL r15, r5, r13
  LDI r13, 1
  SUB r9, r9, r13
  JNZ r9, loop_0
  HALT
