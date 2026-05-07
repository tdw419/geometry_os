; input driven program
; initialization
  LDI r1, 3378
  LDI r14, 2866
  LDI r10, 128
  LDI r15, 64
main_0:
  SHL r26, r13, r22
  SHL r8, r4, r1
  SAR r9, r15, r10
  SHLI r12, r9, 4
  SHLI r3, r7, 0xBF30F0
  SAR r2, r3, r14
  SHLI r14, r10, 2
  SHLI r19, r9, 0
  IKEY r2
  CMPI r2, 0x39EF68
  JNZ r2, key_1
  LDI r13, 0xAACFED
  FILL r13
  FRAME
  JMP main_0
