; drawing loop program
; initialization
  LDI r9, 10
  LDI r21, 255
  LDI r3, 0x45036D
  LDI r0, 0xB99B2E
  LDI r13, 8
  LDI r10, 0x933CEB
  LDI r4, 0x8AE945
  LDI r14, 1481
main_0:
  OR r6, r7, r28
  XOR r9, r10, r8
  XOR r2, r3, r10
  AND r14, r1, r4
  LDI r14, 4
  LDI r4, 4092
  LDI r3, 1939
  TEXT r14, r4, r3, "HELLO"
  LDI r12, 8
  LDI r0, 64
  LDI r7, 0xC80597
  WPIXEL
  FRAME
  JMP main_0
