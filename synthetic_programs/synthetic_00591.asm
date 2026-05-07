; input driven program
; initialization
  LDI r2, 3300
  LDI r15, 4
  LDI r8, 740
  LDI r11, 4
  LDI r10, 64
main_0:
  AND r6, r19, r4
  XOR r3, r6, r9
  OR r5, r10, r2
  AND r2, r3, r10
  LDI r8, 2368
  LDI r1, 3852
  LDI r2, 2
  TEXT r8, r1, r2, "HELLO"
  FRAME
  JMP main_0
