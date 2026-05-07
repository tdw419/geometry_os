; drawing loop program
; initialization
  LDI r14, 274
  LDI r2, 552
  LDI r10, 64
  LDI r5, 4
  LDI r4, 0xFA58A3
  LDI r9, 2679
  LDI r6, 2944
main_0:
  ANDI r9, r15, 12
  AND r13, r12, r5
  AND r7, r8, r1
  OR r11, r0, r19
  XOR r13, r5, r8
  XOR r4, r13, r3
  AND r11, r3, r0
  XOR r8, r21, r9
  OR r13, r7, r10
  IKEY r9
  CMPI r9, 163
  JNZ r9, key_1
  SHR r14, r10, r12
  FRAME
  JMP main_0
