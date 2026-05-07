; drawing loop program
; initialization
  LDI r6, 3282
  LDI r14, 0x79D9A9
  LDI r9, 0
  LDI r13, 1
  LDI r15, 2570
main_0:
  XOR r4, r9, r14
  AND r2, r5, r6
  AND r12, r29, r4
  OR r10, r3, r14
  OR r13, r15, r6
  IKEY r9
  CMPI r9, 225
  JNZ r9, key_1
  LDI r10, 2883
  LDI r4, 1667
  LDI r15, 0x1F4580
  DRAWTEXT r10, r4, r15, "WORLD"
  FRAME
  JMP main_0
