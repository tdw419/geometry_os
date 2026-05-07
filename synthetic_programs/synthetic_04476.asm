; input driven program
; initialization
  LDI r9, 1121
  LDI r3, 1283
  LDI r8, 256
  LDI r11, 3186
  LDI r2, 0x20CB12
main_0:
  AND r6, r15, r13
  XOR r9, r1, r15
  AND r4, r8, r2
  AND r2, r4, r5
  AND r13, r5, r1
  XOR r6, r14, r2
  XOR r6, r2, r12
  AND r10, r6, r14
  LDI r13, 698
  LDI r1, 3878
  LDI r6, 0xEFCE16
  TEXT r13, r1, r6, "HELLO"
  FRAME
  JMP main_0
