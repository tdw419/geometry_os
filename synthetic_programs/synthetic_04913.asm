; input driven program
; initialization
  LDI r28, 2869
  LDI r8, 1935
  LDI r15, 0xAD3571
  LDI r10, 3192
  LDI r14, 0
  LDI r6, 1833
main_0:
  SHR r2, r10, r6
  SHL r15, r2, r7
  SHR r9, r10, r4
  SHL r27, r13, r14
  IKEY r2
  CMPI r2, 49
  JNZ r2, key_1
  LDI r5, 305
  FILL r5
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_2
  FRAME
  JMP main_0
