; input driven program
; initialization
  LDI r0, 8
  LDI r4, 32
  LDI r14, 0x02A085
  LDI r3, 4
main_0:
  SUB r7, r5, r0
  LDI r8, 256
  LDI r0, 2158
  LDI r10, 256
  LDI r25, 3041
  LDI r10, 1011
  LINE r8, r0, r10, r25, r10
  IKEY r10
  CMPI r10, 2
  JNZ r10, key_1
  LDI r10, 32
  FILL r10
  AND r10, r2, r4
  XOR r28, r15, r9
  AND r13, r12, r19
  XOR r2, r13, r0
  OR r4, r6, r24
  XOR r9, r13, r6
  FRAME
  JMP main_0
