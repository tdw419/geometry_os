; mixed program
; initialization
  LDI r2, 10
  LDI r14, 509
  LDI r6, 2619
  LDI r7, 128
  XOR r14, r29, r8
  LDI r7, 3240
  LDI r6, 2493
  LDI r5, 4
  PSETI
  OR r14, r5, r15
  AND r10, r12, r0
  AND r8, r10, r15
  LDI r10, 24
loop_0:
  MUL r14, r1, r9
  LDI r13, 1
  SUB r10, r10, r13
  JNZ r10, loop_0
  IKEY r5
  CMPI r5, 2
  JNZ r5, key_1
  OR r13, r9, r1
  XOR r5, r11, r7
  HALT
