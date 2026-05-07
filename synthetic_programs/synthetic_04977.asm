; input driven program
; initialization
  LDI r3, 32
  LDI r5, 2214
  LDI r0, 2431
  LDI r12, 16
  LDI r2, 10
main_0:
  LDI r14, 0
  FILL r14
  IKEY r14
  CMPI r14, 116
  JNZ r14, key_1
  SAR r9, r3, r8
  SAR r6, r10, r14
  SHLI r11, r0, 1
  SHLI r15, r5, 4
  SAR r5, r14, r1
  FRAME
  JMP main_0
