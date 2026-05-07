; drawing loop program
; initialization
  LDI r13, 255
  LDI r22, 0x89F1CB
  LDI r9, 255
main_0:
  CMPI r0, 256
  LDI r12, 0x1D1328
  FILL r12
  SHR r12, r1, r5
  SHL r4, r8, r26
  SHL r14, r15, r2
  IKEY r1
  CMPI r1, 241
  JNZ r1, key_1
  CMPI r6, r10, 32
  FRAME
  JMP main_0
