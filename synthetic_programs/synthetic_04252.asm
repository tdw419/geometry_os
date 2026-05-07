; drawing loop program
; initialization
  LDI r4, 403
  LDI r3, 0x57DB60
  LDI r13, 0x526F71
  LDI r6, 4
  LDI r7, 0x7AE886
  LDI r16, 4
  LDI r9, 0
main_0:
  LDI r4, 2
  LDI r12, 576
  LDI r6, 3821
  PSETI
  LDI r13, 2512
  LDI r14, 0xFC77F1
  LDI r0, 4
  DRAWTEXT r13, r14, r0, "WORLD"
  AND r12, r4, r14
  AND r15, r10, r2
  AND r5, r1, r9
  IKEY r3
  CMPI r3, 72
  JNZ r3, key_1
  CMPI r4, 0xF3B091
  CMP r11, r15
  FRAME
  JMP main_0
