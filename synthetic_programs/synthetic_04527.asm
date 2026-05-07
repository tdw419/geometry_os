; input driven program
; initialization
  LDI r0, 2
  LDI r13, 177
  LDI r5, 1
  LDI r7, 0x7F1D33
main_0:
  XOR r11, r1, r4
  XOR r4, r8, r13
  AND r0, r6, r3
  OR r2, r26, r9
  AND r8, r11, r15
  XOR r22, r10, r0
  AND r9, r14, r5
  IKEY r13
  CMPI r13, 1
  JNZ r13, key_1
  CMP r13, r19
  LDI r10, 0xB83F52
  LDI r14, 2862
  LDI r6, 1567
  DRAWTEXT r10, r14, r6, "WORLD"
  FRAME
  JMP main_0
